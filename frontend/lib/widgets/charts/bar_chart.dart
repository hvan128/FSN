import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/text.dart';

class BarType {
  final double value;
  final Color color;

  const BarType({
    required this.value,
    required this.color,
  }) : assert(value >= 0);
}

class XLabelType {
  final String label;
  final String? description;

  const XLabelType({required this.label, this.description});
}

class BarChart extends StatelessWidget {
  final List<List<BarType>> barList;
  final List<XLabelType> xLabel;
  final double barWidth;
  final double? spaceBetweenBar;
  final int? numberOfTicks;

  BarChart({
    super.key,
    required this.barList,
    required this.barWidth,
    required this.xLabel,
    this.spaceBetweenBar = 0,
    this.numberOfTicks = 6,
  })  : assert(barWidth >= 0),
        assert(spaceBetweenBar! >= 0),
        assert(xLabel.length == barList.length),
        assert(numberOfTicks! > 1);

  List<double> _caculateYLabel(List<double> values, int numberOfTicks) {
    List<double> labels = [];

    // Find max value
    double maxValue =
        values.reduce((value, element) => element > value ? element : value);

    int numberOfDigits = maxValue.ceil().toString().length;

    // Find most ceiling multiple of 10 step
    double step =
        ((maxValue / ((numberOfTicks - 1) * pow(10, numberOfDigits - 2)))
                .ceilToDouble() *
            ((numberOfTicks - 1) * pow(10, numberOfDigits - 2)) /
            (numberOfTicks - 1));

    for (int i = 0; i < numberOfTicks; i++) {
      labels.add(step * i);
    }

    return labels;
  }

  @override
  Widget build(BuildContext context) {
    final List<double> yLabels;
    yLabels = _caculateYLabel(
      barList.expand((e) => e).map((e) => e.value).toList(),
      numberOfTicks!,
    );

    final double maxLabel = yLabels[numberOfTicks! - 1];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constrains) => SizedBox(
              width: constrains.maxWidth,
              height: constrains.maxWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ...yLabels.reversed.map(
                          (e) => MyText(
                            text: FunctionCore.shortenNumberValue(e),
                            fontSize: FontSize.z12,
                            fontWeight: FontWeight.w600,
                            color: MyColors.primary['KiduBlue']!['c500']!,
                            lineHeight: 16 / FontSize.z12,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    flex: 1,
                    child: LayoutBuilder(builder: (context, constrains) {
                      return SizedBox(
                        width: constrains.maxWidth,
                        height: constrains.maxHeight,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            // Horizontal grid lines
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 8,
                              bottom: 8,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ...List.filled(
                                      numberOfTicks!,
                                      CustomPaint(
                                        size: Size(constrains.maxWidth, 1),
                                        painter: const _LineGridDraw(
                                            isVertical: false),
                                      ),
                                    ),
                                    CustomPaint(
                                      size: Size(constrains.maxWidth, 1),
                                      painter: const _LineGridDraw(
                                          isVertical: false, isSolid: true),
                                    ),
                                  ]),
                            ),
                            // Vertical grid lines
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 8,
                              bottom: 8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.filled(
                                  barList.length + 1,
                                  CustomPaint(
                                    size: Size(1, constrains.maxHeight),
                                    painter:
                                        const _LineGridDraw(isVertical: true),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: constrains.maxWidth,
                              height: constrains.maxHeight,
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                // horizontal: 16,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ...barList.map(
                                    (e) => Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: spaceBetweenBar!,
                                      direction: Axis.horizontal,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.end,
                                      children: e
                                          .map(
                                            (e) => CustomPaint(
                                              size: Size(
                                                barWidth,
                                                constrains.maxHeight - 16,
                                              ),
                                              painter: _Bar(
                                                height: e.value /
                                                    maxLabel *
                                                    (constrains.maxHeight - 16),
                                                color: e.color,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 30 + 12, // gap between y label and visualization
              ),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: xLabel
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              text: e.label,
                              fontSize: FontSize.z13,
                              fontWeight: FontWeight.w600,
                              color: MyColors.primary['KiduBlue']!['c700']!,
                              lineHeight: 18 / FontSize.z13,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 2),
                            if (e.description != null)
                              MyText(
                                text: e.description ?? '',
                                fontSize: FontSize.z10,
                                fontWeight: FontWeight.w600,
                                color: MyColors.grey['c500']!,
                                lineHeight: 1.2,
                                textAlign: TextAlign.center,
                                letterSpacing: -0.2,
                              )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _LineGridDraw extends CustomPainter {
  final bool isVertical;
  final double? lineWidth;
  final bool? isSolid;

  const _LineGridDraw({
    required this.isVertical,
    this.lineWidth = 1,
    this.isSolid = false,
  }) : assert(lineWidth != null && lineWidth > 0);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.grey['c200']!
      ..strokeWidth = lineWidth ?? 0.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    // Horizontal line
    if (!isVertical) {
      for (double i = 0; i < size.width; i = i + 12) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 6, 0.0), paint);
      }

      if (isSolid!) {
        canvas.drawLine(const Offset(0, 0), Offset(size.width, 0.0), paint);
      }
    } else {
      for (double i = 0; i < size.height; i = i + 12) {
        canvas.drawLine(Offset(0.0, i), Offset(0.0, i + 6), paint);
      }

      if (isSolid!) {
        canvas.drawLine(const Offset(0, 0), Offset(0.0, size.height), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Bar extends CustomPainter {
  final Color color;
  final double height;

  const _Bar({
    required this.color,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTRB(0, size.height, size.width, height),
      const Radius.circular(999),
    );
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
