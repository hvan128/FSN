import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final bool hasError; // Added hasError property
  final String? errorText;
  final String? label;
  final double? borderRadius;
  final String? value;
  final void Function(String)? onChange;

  const MyTextField({
    super.key,
    this.hintText,
    required this.obscureText,
    required this.hasError, // Added hasError property
    this.errorText,
    required this.label,
    this.borderRadius = 16,
    this.value = '',
    this.onChange,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
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
          height: 64,
          child: TextField(
              maxLines: null,
              expands: true,
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _controller.text = value;
                });
                widget.onChange!(value);
              },
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: !widget.hasError ? 1 : 2,
                      color: !widget.hasError
                          ? MyColors.grey['c200']!
                          : MyColors.support['Error']!['c900']!,
                    ),
                    borderRadius: BorderRadius.circular(widget.borderRadius!)),
                disabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: MyColors.grey['c900']!),
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: MyColors.primary['KiduBlue']!['c700']!),
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                ),
                fillColor: !widget.hasError
                    ? Colors.transparent
                    : MyColors.support['Error']!['c400']!,
                filled: true,
                label: MyText(
                    text: widget.label ?? '',
                    color: MyColors.grey['c500']!,
                    fontSize: FontSize.z16,
                    fontWeight: FontWeight.w600),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: MyColors.grey['c200']!,
                    fontSize: FontSize.z16,
                    fontWeight: FontWeight.w600),
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
