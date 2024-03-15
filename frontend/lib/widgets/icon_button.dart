import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Color? bgColor;
  final String src;
  final double widthIcon;
  final double heightIcon;
  final double borderRadius;
  final VoidCallback? onPressed;
  final double padding;

  const MyIconButton({
    super.key,
    this.bgColor,
    required this.src,
    required this.widthIcon,
    required this.heightIcon,
    this.onPressed,
    this.borderRadius = 30,
    this.padding = 14,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
        ),
        padding: EdgeInsets.all(padding),
        child: Image(
          image: AssetImage(src),
          width: widthIcon,
          height: heightIcon,
        ),
      ),
    );
  }
}
