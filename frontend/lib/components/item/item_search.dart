import 'package:flutter/material.dart';
import 'package:frontend/screen/search/search_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/text.dart';

class ItemSearch extends StatefulWidget {
  final Category category;
  final SearchType type;
  const ItemSearch({
    super.key,
    required this.category,
    required this.type,
  });

  @override
  State<ItemSearch> createState() => _ItemSearchState();
}

class _ItemSearchState extends State<ItemSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: MyColors.primary['CulturalYellow']!['c50']!,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              widget.category.icon,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MyText(
            text: widget.category.label,
            fontSize: FontSize.z14,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c700']!,
          ),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyText(
              text: widget.type == SearchType.all
                  ? foods
                      .firstWhere(
                          (element) => element.value == widget.category.type)
                      .label
                  : 'Tủ lạnh',
              fontSize: FontSize.z12,
              fontWeight: FontWeight.w400,
              color: MyColors.grey['c700']!),
        ),
      ]),
    );
  }
}
