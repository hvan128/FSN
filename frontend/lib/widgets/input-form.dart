import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class InputForm extends StatelessWidget {
  final String label;
  final Widget content;
  const InputForm({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: MyColors.white['c900']!,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: label,
              fontSize: FontSize.z14,
              fontWeight: FontWeight.w600,
              color: MyColors.grey['c900']!,
            ),
            content
          ],
        ));
  }
}
