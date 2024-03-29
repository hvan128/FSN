import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  const MyIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.width = 25,
      this.height = 25});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: IconButton(
            padding: EdgeInsets.zero, onPressed: onPressed, icon: icon));
  }
}
