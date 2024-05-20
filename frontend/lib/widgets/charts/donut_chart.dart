import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';

class ArcType {
  final double value;
  final Color color;
  final String label;

  const ArcType({
    required this.value,
    required this.color,
    required this.label,
  }) : assert(value >= 0);
}

class _ArcDrawType extends ArcType {
  final double percentage;

  _ArcDrawType(ArcType instances, {required this.percentage})
      : super(
          value: instances.value,
          color: instances.color,
          label: instances.label,
        );
}

class DonutChart extends StatelessWidget {
  final double edgeWidth;
  final List<ArcType> arcList;
  final StrokeCap? edgeCap;
  final Widget? centerContent;

  DonutChart({
    super.key,
    this.edgeWidth = 16,
    required this.arcList,
    this.edgeCap = StrokeCap.round,
    this.centerContent,
  })  : assert(edgeWidth >= 0),
        assert(arcList.isNotEmpty);

  List<_ArcDrawType> _caculatePercent(List<ArcType> values) {
    double total = values.fold(
      0,
      (previousValue, element) => previousValue + element.value,
    );

    return values
        .map((e) => _ArcDrawType(e, percentage: e.value / total))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<_ArcDrawType> percentages = _caculatePercent(arcList);

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            constraints:
                BoxConstraints(minHeight: 240, minWidth: constraints.maxWidth),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                Center(
                  child: CustomPaint(
                    size: Size.square(216 - edgeWidth),
                    painter: _DonutDraw(
                      edgeCap: edgeCap!,
                      arcItems: percentages,
                      edgeWidth: edgeWidth,
                    ),
                  ),
                ),
                // Title
                if (centerContent != null) centerContent!,
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Legend
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: MyColors.primary['CulturalYellow']!['c50'],
            ),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: percentages.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 6,
                        children: [
                          CustomPaint(
                            size: const Size.square(14),
                            painter:
                                _CircleDraw(color: percentages[index].color),
                          ),
                          MyText(
                            text: percentages[index].label,
                            fontSize: FontSize.z14,
                            fontWeight: FontWeight.w600,
                            color: MyColors.grey['c500']!,
                            lineHeight: 1.43,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 0,
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 6,
                        children: [
                          MyText(
                            text: FunctionCore.convertMoneyFormat(
                              percentages[index].value,
                              Format.real,
                            ),
                            fontSize: FontSize.z14,
                            fontWeight: FontWeight.w600,
                            color: MyColors.grey['c500']!,
                            lineHeight: 1.43,
                          ),
                          MyText(
                            text: '|',
                            fontSize: FontSize.z14,
                            fontWeight: FontWeight.normal,
                            color: MyColors.grey['c200']!,
                          ),
                          SizedBox(
                            width: 32,
                            child: MyText(
                              textAlign: TextAlign.right,
                              text: percentages[index].percentage.isNaN ? '0%' :
                                  '${(percentages[index].percentage * 100).roundToDouble() < 10 ? '0' : ''}${(percentages[index].percentage * 100).roundToDouble().toStringAsFixed(0)}%',
                              fontSize: FontSize.z14,
                              fontWeight: FontWeight.w700,
                              color: MyColors.grey['c600']!,
                              lineHeight: 1.285,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: MyDivider(),
              ),
            ),
          )
        ],
      );
    });
  }
}

class _CircleDraw extends CustomPainter {
  final Color color;

  _CircleDraw({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _DonutDraw extends CustomPainter {
  final double edgeWidth;
  final List<_ArcDrawType> arcItems;
  final StrokeCap edgeCap;

  _DonutDraw({
    required this.arcItems,
    required this.edgeWidth,
    required this.edgeCap,
  }) : assert(edgeWidth > 0);

  @override
  void paint(Canvas canvas, Size size) {
    Rect myRect = const Offset(0, 0) & size;

    double curAngle = 3 * pi / 2; // Start angle to draw

    for (int i = arcItems.length - 1; i >= 0; i--) {
      Paint paint = Paint()
        ..color = arcItems[i].color
        ..strokeWidth = edgeWidth
        ..strokeCap = edgeCap
        ..style = PaintingStyle.stroke;

      double addAngle = arcItems[i].percentage * 2 * pi; // Sweep angle

      canvas.drawArc(myRect, curAngle, -addAngle, false, paint);

      curAngle -= addAngle; // next start angle
    }
  }

  double getRadians(double value) {
    return (360 * value) * pi / 180;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
