import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class ItemFood extends StatefulWidget {
  final String label;
  final String icon;
  final bool isSelected;
  const ItemFood(
      {super.key,
      required this.label,
      required this.icon,
      this.isSelected = false});

  @override
  State<ItemFood> createState() => _ItemFoodState();
}

class _ItemFoodState extends State<ItemFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected
              ? MyColors.primary['CulturalYellow']!['c500']!
              : MyColors.primary['CulturalYellow']!['c50']!,
        ),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? MyColors.primary['CulturalYellow']!['c500']!
                      : MyColors.white['c900']!,
                ),
                padding: const EdgeInsets.only(
                    top: 17, bottom: 8, left: 15, right: 15),
                child: Image.asset(widget.icon, width: 40, height: 40)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: SizedBox(
                width: 70,
                child: MyText(
                  text: widget.label,
                  fontSize: FontSize.z12,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c700']!,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }
}
