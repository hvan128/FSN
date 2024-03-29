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
  final IconData? startIcon;
  final IconData? endIcon;
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
        textColor = MyColors.primary['CulturalYellow']!['c700']!;
        break;

      case ButtonType.yellow:
        bgColor = MyColors.primary['CulturalYellow']!['c700']!;
        textColor = MyColors.white['c900'];
        break;

      case ButtonType.disable:
        bgColor = MyColors.grey['c100']!;
        textColor = MyColors.grey['c400']!;
        break;
      case ButtonType.delete:
        bgColor = MyColors.support['Error']!['c400']!;
        textColor = MyColors.support['Error']!['c900']!;
        break;
      case ButtonType.transparent:
        bgColor = MyColors.white['c900'];
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
            Icon(
              startIcon,
              size: sizeStartIcon,
            ),
            const SizedBox(
              width: 4,
            ),
            MyText(
              text: text,
              fontSize: FontSize.z16,
              fontWeight: FontWeight.w700,
              color: textColor!,
            ),
            const SizedBox(
              width: 4,
            ),
            Icon(
              endIcon,
              size: sizeEndIcon,
            ),
          ],
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, disable, delete, transparent, yellow }
