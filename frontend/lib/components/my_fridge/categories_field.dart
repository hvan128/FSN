import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/types/food.dart';

class CategoriesField extends StatelessWidget {
  final List<ItemCategory> categories;
  const CategoriesField({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: categories
          .map((category) => CategoryItem(category: category))
          .toList(),
    );
  }
}