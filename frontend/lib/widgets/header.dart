import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/icon_button.dart';
import 'package:frontend/widgets/text.dart';

class MyHeader extends StatefulWidget {
  final String title;
  final String srcLeftIcon;
  final String srcRightIcon;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Function()? onLeftPressed;
  final Function()? onRightPressed;
  final bool disableLeftButton;
  final bool disableRightButton;
  final double height;
  final Color? bgColor;
  final Color? bgUnderColor;
  final bool? hasIconColor;
  final Widget? customTitle;
  final double? sizeLeftIcon;
  final double? sizeRightIcon;

  const MyHeader({
    super.key,
    this.title = "",
    this.srcLeftIcon = "assets/icons/i16/back.png",
    this.srcRightIcon = "assets/icons/i16/close.png",
    this.leftIcon,
    this.rightIcon,
    this.onLeftPressed,
    this.onRightPressed,
    this.disableLeftButton = false,
    this.disableRightButton = false,
    this.height = 50,
    this.bgUnderColor,
    this.hasIconColor = false,
    this.bgColor = Colors.transparent,
    this.customTitle,
    this.sizeLeftIcon,
    this.sizeRightIcon,
  });

  @override
  State<MyHeader> createState() => _HeaderState();
}

class _HeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Container(
              color: widget.bgColor == Colors.transparent
                  ? Colors.transparent
                  : widget.bgUnderColor ??
                      MyColors.primary['KiduBlue']!['c50']!,
              height: widget.height,
              width: double.infinity),
          Container(
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: widget.bgColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  if (!widget.disableLeftButton)
                    widget.bgColor == Colors.transparent && widget.hasIconColor!
                        ? GestureDetector(
                            onTap: widget.disableLeftButton
                                ? null
                                : widget.onLeftPressed ??
                                    _defaultOnLeftPressed(context),
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset(
                                'assets/icons/i16/back.png',
                                width: 16,
                                height: 16,
                              ),
                            ),
                          )
                        : widget.leftIcon != null
                            ? GestureDetector(
                                onTap: widget.disableLeftButton
                                    ? null
                                    : widget.onLeftPressed ??
                                        _defaultOnLeftPressed(context),
                                child: Row(
                                  children: [
                                    widget.leftIcon!,
                                  ],
                                ))
                            : MyIconButton(
                                src: widget.srcLeftIcon,
                                heightIcon: 16,
                                widthIcon: 16,
                                onPressed: widget.disableLeftButton
                                    ? null
                                    : widget.onLeftPressed ??
                                        _defaultOnLeftPressed(context),
                              ),
                  if (widget.disableLeftButton)
                    const SizedBox(
                      width: 28,
                      height: 28,
                    ),
                  widget.customTitle == null
                      ? MyText(
                          text: widget.title,
                          fontSize: FontSize.z20,
                          fontWeight: FontWeight.w700,
                          color: MyColors.grey['c900']!,
                        )
                      : widget.customTitle!,
                ]),
                if (!widget.disableRightButton)
                  widget.bgColor == Colors.transparent && widget.hasIconColor!
                      ? GestureDetector(
                          onTap: widget.disableRightButton
                              ? null
                              : widget.onRightPressed,
                          child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset(
                                'assets/icons/i16/close.png',
                              )),
                        )
                      : widget.rightIcon != null
                          ? GestureDetector(
                              onTap: widget.disableRightButton
                                  ? null
                                  : widget.onRightPressed,
                              child: Row(
                                children: [
                                  widget.rightIcon!,
                                ],
                              ))
                          : MyIconButton(
                              src: widget.srcRightIcon,
                              heightIcon: 16,
                              widthIcon: 16,
                              onPressed: widget.disableRightButton
                                  ? null
                                  : widget.onRightPressed,
                              padding: 6,
                            ),
                if (widget.disableRightButton)
                  const SizedBox(
                    width: 28,
                    height: 28,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Function() _defaultOnLeftPressed(BuildContext context) {
    return () {
      Navigator.pop(context);
    };
  }

  static Function() _defaultOnRightPressed(BuildContext context) {
    return () {
      Navigator.pop(context);
    };
  }
}
