import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';

class MyTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final double height;
  final Widget? icon;

  const MyTabButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap,
      this.icon,
      this.height = 36.00});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isSelected
                ? MyColors.primary['CulturalYellow']!['c700']
                : MyColors.primary['CulturalYellow']!['c100'],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: isSelected
                      ? MyColors.white['c900']
                      : MyColors.grey['c600'],
                  fontSize: FontSize.z13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
