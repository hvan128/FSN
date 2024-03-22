import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class MyTextArea extends StatefulWidget {
  final String? hintText;
  final bool hasError; // Added hasError property
  final String? label;
  final double? borderRadius;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final void Function(String)? onChange;
  final String? value;

  const MyTextArea({
    super.key,
    this.hintText,
    required this.hasError, // Added hasError property
    required this.label,
    this.borderRadius = 16,
    this.maxLines = 2,
    this.maxLength = 30,
    this.enabled = true,
    this.onChange,
    this.value = '',
  });
  
  @override
  // ignore: library_private_types_in_public_api
  _MyTextAreaState createState() => _MyTextAreaState();
}

class _MyTextAreaState extends State<MyTextArea> {
  final TextEditingController _controller = TextEditingController();
  int count = 0;

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
        TextField(
            controller: _controller,
            onChanged: (value) {
              setState(() {
                count = value.length;
                _controller.text = value;
              });
              widget.onChange!(value);
            },
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            buildCounter: (BuildContext context,
                    {int? currentLength, int? maxLength, bool? isFocused}) =>
                null,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: !widget.hasError ? 1 : 2,
                    color: !widget.hasError
                        ? MyColors.grey['c200']!
                        : MyColors.support['Error']!['c900']!,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius!)),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: MyColors.grey['c200']!,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius!),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyColors.primary['CulturalYellow']!['c800']!,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius!),
              ),
              fillColor: !widget.enabled
                  ? MyColors.grey['c50']
                  : widget.hasError
                      ? MyColors.support['Error']!['c300']!
                      : MyColors.white['c900']!,
              filled: true,
              label: Text(widget.label ?? '',
                  style: TextStyle(
                      fontSize: FontSize.z14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c900']!)),
              labelStyle: TextStyle(
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: MyColors.grey['c200']!,
                  fontSize: FontSize.z16,
                  fontWeight: FontWeight.w600),
            )),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.hasError
                  ? Image.asset('assets/icons/i16/warning.png',
                      width: 16, height: 16)
                  : const SizedBox(width: 0),
              widget.hasError
                  ? const SizedBox(width: 6)
                  : const SizedBox(width: 0),
              MyText(
                text: '$count/${widget.maxLength} characters',
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
