import 'package:flutter/material.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class ItemIngredient extends StatelessWidget {
  final Category category;
  final bool? isSelected;
  const ItemIngredient(
      {super.key, required this.category, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4, left: 4),
      decoration: BoxDecoration(
        color: isSelected!
            ? MyColors.primary['CulturalYellow']!['c300']!
            : MyColors.grey['c100']!,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          !isSelected!
              ? Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: MyColors.white['c900']!,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(category.icon ?? 'assets/icons/i16/image-default.png',
                      width: 20, height: 20))
              : Container(
                  decoration: BoxDecoration(
                    color: MyColors.white['c900']!,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset('assets/icons/i16/check-outline.png',
                      color: MyColors.primary['CulturalYellow']!['c600']!,
                      width: 26,
                      height: 26),
                ),
          const SizedBox(width: 8),
          MyText(
            text: category.label!,
            fontSize: FontSize.z12,
            fontWeight: FontWeight.w500,
            color: MyColors.grey['c700']!,
          )
        ],
      ),
    );
  }
}
