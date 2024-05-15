import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

enum TextFieldType { normal, border }

class MyTextField extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final bool hasError;
  final String? errorText;
  final double? height;
  final double? width;
  final double? fontSize;
  final String? label;
  final Icon? prefixIcon;
  final double? borderRadius;
  final String? value;
  final FontWeight? hintFontWeight;
  final FontWeight? labelFontWeight;
  final Color? labelColor;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final bool? multipleLine;
  final int? hintMaxLines;
  final bool? isReadOnly;

  const MyTextField({
    super.key,
    this.hintText,
    required this.obscureText,
    required this.hasError,
    this.errorText,
    this.label,
    this.prefixIcon,
    this.borderRadius = 16,
    this.value = '',
    this.onChange,
    this.controller,
    this.height,
    this.width,
    this.fontSize,
    this.labelFontWeight,
    this.labelColor,
    this.hintFontWeight,
    this.multipleLine = false,
    this.hintMaxLines = 10,
    this.isReadOnly = false,
  });

  @override
  State createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: widget.width ?? double.infinity,
          child: TextField(
              readOnly: widget.isReadOnly!,
              minLines: 1,
              maxLines: 10,
              cursorColor: MyColors.primary['CulturalYellow']!['c700']!,
              keyboardType: widget.multipleLine!
                  ? TextInputType.multiline
                  : TextInputType.text,
              controller: widget.controller ?? _controller,
              style: TextStyle(
                  color: widget.labelColor ?? MyColors.grey['c900']!,
                  fontSize: widget.fontSize ?? FontSize.z16,
                  fontWeight: widget.labelFontWeight ?? FontWeight.w400),
              onChanged: (value) {
                setState(() {
                  _controller.text = widget.controller?.text ?? value;
                });
                if (widget.onChange != null) {
                  widget.onChange!(value);
                }
              },
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                hintMaxLines: widget.hintMaxLines,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.grey['c200']!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.grey['c200']!),
                ),
                focusColor: MyColors.grey['c200']!,
                fillColor: !widget.hasError
                    ? Colors.transparent
                    : MyColors.support['Error']!['c400']!,
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: MyColors.grey['c300']!,
                    fontSize: widget.fontSize ?? FontSize.z16,
                    fontWeight: widget.hintFontWeight ?? FontWeight.w400),
              )),
        ),
        !widget.hasError
            ? const SizedBox(height: 0)
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 6),
                    MyText(
                      text: widget.errorText!,
                      fontSize: FontSize.z13,
                      lineHeight: 1.38,
                      fontWeight: FontWeight.w600,
                      color: !widget.hasError
                          ? MyColors.grey['c400']!
                          : MyColors.support['Error']!['c800']!,
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
