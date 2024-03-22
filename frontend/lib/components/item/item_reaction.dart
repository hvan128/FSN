import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/widgets/text.dart';

class ItemReaction extends StatelessWidget {
  final Item reaction;
  final String quantity;
  final bool? isSelected;
  const ItemReaction(
      {super.key,
      this.isSelected = false,
      required this.reaction,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 4, top: 3.5, bottom: 3.5, left: 4),
      decoration: BoxDecoration(
        color: isSelected != null && isSelected!
            ? MyColors.primary['CulturalYellow']!['c200']!
            : MyColors.grey['c100']!,
        borderRadius: BorderRadius.circular(100),
        border: isSelected != null && isSelected!
            ? Border.all(color: MyColors.primary['CulturalYellow']!['c700']!)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          reaction.icon != null
              ? Image.asset(reaction.icon!, width: 15, height: 15)
              : Container(),
          const SizedBox(width: 5),
          MyText(
            text: quantity,
            fontSize: FontSize.z12,
            fontWeight: isSelected != null && isSelected!
                ? FontWeight.w800
                : FontWeight.w500,
            color: isSelected != null && isSelected!
                ? MyColors.primary['CulturalYellow']!['c800']!
                : MyColors.grey['c500']!,
          )
        ],
      ),
    );
  }
}
