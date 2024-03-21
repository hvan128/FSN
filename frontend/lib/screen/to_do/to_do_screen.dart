import 'package:flutter/material.dart';
import 'package:frontend/components/to_do/drag_and_drop_list.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';

class TodoScreen extends StatelessWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const TodoScreen({super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  Widget build(BuildContext context) {
    final List<Food> listFoods = foods.map((food) {
      return Food(
        categories: food.categories.length > 3
            ? food.categories.sublist(0, 3)
            : food.categories,
        value: food.value,
        label: food.label,
        icon: food.icon,
      );
    }).toList();
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
          child: DragNDropList(
        listFoods: listFoods,
        showBottomBar: showBottomBar,
        navigateBottomBar: navigateBottomBar,
      )),
    );
  }
}
