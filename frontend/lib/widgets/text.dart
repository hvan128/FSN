import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;
  final Color? decorationColor;
  final double letterSpacing;
  final String fontFamily;
  final TextAlign? textAlign;
  final double? lineHeight;
  final Shadow? shadow;

  const MyText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      this.decoration = TextDecoration.none,
      this.letterSpacing = 0.01,
      this.fontFamily = "Urbanist",
      this.lineHeight,
      this.shadow,
      this.decorationColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily,
          decoration: decoration,
          decorationColor: decorationColor,
          letterSpacing: letterSpacing,
          height: lineHeight,
          shadows: shadow == null ? null : [shadow!],
        ));
  }
}
