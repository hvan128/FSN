import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/components/item/item_food.dart';
import 'package:frontend/screen/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  Category? selectedCategory;
  Food? selectedFood;
  @override
  void initState() {
    super.initState();
    selectedFood = null;
    selectedCategory = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(children: [
          MyHeader(
            title: selectedFood != null && selectedFood?.label != null
                ? selectedFood!.label
                : "Add Category",
            bgColor: MyColors.white['c900']!,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: MyColors.white['c900']!,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Wrap(
                            spacing: 10,
                            children: foods
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedFood = e;
                                        });
                                      },
                                      child: ItemFood(
                                          label: e.label,
                                          icon: e.icon,
                                          isSelected: selectedFood == e),
                                    ))
                                .toList()),
                        const SizedBox(height: 10),
                        const MyDivider(),
                        const SizedBox(height: 10),
                        selectedFood != null
                            ? Wrap(
                                spacing: 10,
                                children: selectedFood!.categories
                                    .map((e) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = e;
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddCategoryDetailScreen(
                                                        category: e),
                                              ));
                                        },
                                        child: ItemFood(
                                            label: e.label, icon: e.icon)))
                                    .toList(),
                              )
                            : Container()
                      ]))
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
