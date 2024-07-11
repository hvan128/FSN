import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class InputForm extends StatefulWidget {
  final String label;
  final Widget content;
  final bool? disable;
  const InputForm(
      {super.key,
      required this.label,
      required this.content,
      this.disable = false});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            decoration: BoxDecoration(
              color: MyColors.white['c900']!,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: widget.label,
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!,
                ),
                widget.content
              ],
            )),
        widget.disable == true
            ? Positioned.fill(
                child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.grey['c50']!.withOpacity(0.7),
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}
