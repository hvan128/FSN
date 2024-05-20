import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final double? width;
  final double? height;
  final Widget? startIcon;
  final Widget? endIcon;
  final double? sizeStartIcon;
  final double? sizeEndIcon;
  final double? fontSize;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonType = ButtonType.primary,
    this.width,
    this.height,
    this.startIcon,
    this.endIcon,
    this.sizeStartIcon,
    this.sizeEndIcon,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    Color? bgColor;
    Color? textColor;

    switch (buttonType) {
      case ButtonType.primary:
        bgColor = MyColors.primary['CulturalYellow']!['c700']!;
        textColor = MyColors.grey['c900']!;
        break;
      case ButtonType.secondary:
        bgColor = MyColors.primary['CulturalYellow']!['c100']!;
        textColor = MyColors.grey['c900']!;
        break;

      case ButtonType.yellow:
        bgColor = MyColors.primary['CulturalYellow']!['c700']!;
        textColor = MyColors.white['c900'];
        break;

      case ButtonType.disable:
        bgColor = MyColors.grey['c400']!;
        textColor = MyColors.white['c900']!;
        break;
      case ButtonType.delete:
        bgColor = MyColors.support['Error']!['c400']!;
        textColor = MyColors.support['Error']!['c900']!;
        break;
      case ButtonType.transparent:
        bgColor = MyColors.transparent;
        textColor = MyColors.grey['c900']!;
        break;
      default:
        bgColor = MyColors.primary['CulturalYellow']!['c900']!;
        textColor = MyColors.whiteOpacity['c900']!;
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          // elevation: 10,
          disabledBackgroundColor: MyColors.grey['c100']!,
          disabledForegroundColor: MyColors.grey['c400']!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            startIcon == null ? const SizedBox() : startIcon!,
            startIcon == null ? const SizedBox() : const SizedBox(
              width: 4,
            ),
            MyText(
              text: text,
              fontSize: FontSize.z16,
              fontWeight: FontWeight.w700,
              color: textColor!,
            ),
            endIcon == null ? const SizedBox() : const SizedBox(
              width: 4,
            ),
            endIcon == null ? const SizedBox() : endIcon!,
          ],
        ),
      ),
    );
  }
}

class MyButtonFeature extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final double? width;
  final double? height;
  final String? startIcon;
  final String? endIcon;
  final Size? sizeStartIcon;
  final Size? sizeEndIcon;
  final double? fontSize;
  final double? fontWeight;
  final Color? textColor;
  final bool disabled;
  final double? lineHeight;
  final bool isFocused;
  final Color? colorStartIcon;
  final Color? colorEndIcon;

  const MyButtonFeature({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonType = ButtonType.primary,
    this.width,
    this.height,
    this.startIcon,
    this.endIcon,
    this.sizeStartIcon,
    this.sizeEndIcon,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.disabled = false,
    this.lineHeight,
    this.isFocused = false,
    this.colorStartIcon,
    this.colorEndIcon,
  })  : assert(
          (startIcon != null && sizeStartIcon != null) || startIcon == null,
          "Require sizeStartIcon if startIcon is provided",
        ),
        assert(
          (endIcon != null && sizeEndIcon != null) || endIcon == null,
          "Require sizeEndIcon if endIcon is provided",
        );

  @override
  Widget build(BuildContext context) {
    Color? bgColor;
    Color? textColorStyle;

    switch (buttonType) {
      case ButtonType.primary:
        bgColor = MyColors.primary['KiduBlue']!['c700']!;
        textColorStyle = MyColors.whiteOpacity['c900']!;
        break;
      case ButtonType.secondary:
        bgColor = MyColors.primary['KiduBlue']!['c100']!;
        textColorStyle = MyColors.primary['KiduBlue']!['c700']!;
        break;

      case ButtonType.yellow:
        bgColor = MyColors.primary['CulturalYellow']!['c800']!;
        textColorStyle = MyColors.white['c900'];
        break;

      case ButtonType.disable:
        bgColor = MyColors.grey['c100']!;
        textColorStyle = MyColors.grey['c400']!;
        break;
      case ButtonType.delete:
        bgColor = MyColors.support['Error']!['c400']!;
        textColorStyle = MyColors.support['Error']!['c900']!;
        break;
      case ButtonType.transparent:
        bgColor = MyColors.white['c900'];
        textColorStyle = MyColors.grey['c900']!;
        break;
      default:
        bgColor = MyColors.primary['KiduBlue']!['c900']!;
        textColorStyle = MyColors.whiteOpacity['c900']!;
    }

    return GestureDetector(
      onTap: buttonType == ButtonType.disable ? null : onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        foregroundDecoration: BoxDecoration(
          border: Border.all(
            style: isFocused ? BorderStyle.solid : BorderStyle.none,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: bgColor!,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        decoration: BoxDecoration(
          color: disabled ? MyColors.grey['c100']! : bgColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            style: isFocused ? BorderStyle.solid : BorderStyle.none,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
            color: MyColors.white['c900']!,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (startIcon != null) ...[
              Image(
                image: AssetImage(startIcon!),
                width: sizeStartIcon!.width,
                height: sizeStartIcon!.height,
                color: colorStartIcon,
              ),
              SizedBox(
                width: 4,
              )
            ],
            MyText(
              text: text,
              fontSize: fontSize ?? FontSize.z16,
              fontWeight: FontWeight.w700,
              color: textColor ?? textColorStyle!,
              lineHeight: lineHeight ?? 1.38,
            ),
            if (endIcon != null) ...[
              SizedBox(
                width: 4,
              ),
              Image(
                image: AssetImage(endIcon!),
                width: sizeEndIcon!.width,
                height: sizeEndIcon!.height,
                color: colorEndIcon,
              )
            ],
          ],
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, disable, delete, transparent, yellow }
