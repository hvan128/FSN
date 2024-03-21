import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/widgets/text.dart';

class ItemCategory extends StatelessWidget {
  final Category category;
  final bool? isSelected;
  const ItemCategory(
      {super.key, required this.category, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.primary['CulturalYellow']!['c50']!,
              border: Border.all(color: MyColors.grey['c100']!),
            ),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: MyColors.white['c900']!,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 8, left: 15, right: 15),
                    child: Image.asset(category.icon, width: 40, height: 40)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SizedBox(
                    width: 70,
                    child: MyText(
                      text: category.label,
                      fontSize: FontSize.z12,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c700']!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )),
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  color: MyColors.grey['c100']!,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: MyColors.grey['c300']!,
                  )),
              child: MyText(
                  text: 'D - ${category.defaultDuration.toInt()}',
                  fontSize: FontSize.z10,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c700']!),
            ),
          ),
        ),
      ),
      isSelected != null && isSelected!
          ? Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.primary['CulturalYellow']!['c700']!
                    .withOpacity(0.5),
              )),
            )
          : const SizedBox(),
      isSelected != null && isSelected!
          ? Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/icons/i16/check-outline.png',
                    width: 20,
                    height: 20,
                    color: MyColors.white['c900'],
                  )))
          : const SizedBox(),
    ]);
  }
}
