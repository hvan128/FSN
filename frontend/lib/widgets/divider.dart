import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';

enum Type { none, solid, dotted }

class MyDivider extends StatelessWidget {
  final double? bdWidth;
  final Color? bdColor;
  final Type? type;

  const MyDivider({
    super.key,
    this.bdWidth,
    this.bdColor,
    this.type = Type.dotted,
  });

  @override
  Widget build(BuildContext context) {
    BorderStyle? borderStyle;

    switch (type) {
      case Type.none:
        borderStyle = BorderStyle.none;
        break;
      case Type.solid:
        borderStyle = BorderStyle.solid;
        break;
      default:
    }

    return type != Type.dotted
        ? SizedBox(
            height: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: bdWidth ?? 1.0,
                    color: bdColor ?? MyColors.grey['c200']!,
                    style: borderStyle ?? BorderStyle.solid,
                  ),
                ),
              ),
            ),
          )
        : Dashing(
            height: bdWidth,
            color: bdColor,
          );
  }
}

class Dashing extends StatelessWidget {
  const Dashing({super.key, double? height, Color? color})
      : height = height ?? 1,
        color = color ?? const Color(0xFFDBDBDB);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 5.0;
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
