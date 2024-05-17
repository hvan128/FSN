import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? rightAction;
  final Widget? features;
  final bool? visibleDivider;

  const CardHeader({
    super.key,
    required this.title,
    this.description,
    this.rightAction,
    this.features,
    this.visibleDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white['c900']!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyText(
                        text: title,
                        fontSize: FontSize.z17,
                        fontWeight: FontWeight.w700,
                        color: MyColors.grey['c800']!,
                        lineHeight: 1.17,
                        letterSpacing: -0.17,
                      ),
                    ),
                    SizedBox(width: 16),
                    if (rightAction != null) rightAction!,
                  ],
                ),
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 14, 0),
                  child: MyText(
                    text: description!,
                    fontSize: FontSize.z13,
                    fontWeight: FontWeight.w600,
                    lineHeight: 1.38,
                    color: MyColors.grey['c600']!,
                  ),
                )
            ],
          ),
          if (features != null) ...[
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: features!,
            ),
          ],
          if (visibleDivider == true) ...[
            SizedBox(height: 18),
            MyDivider(
              type: Type.dotted,
              bdColor: MyColors.grey['c200']!,
            ),
          ]
        ],
      ),
    );
  }
}
