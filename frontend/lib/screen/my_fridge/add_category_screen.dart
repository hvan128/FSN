import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_food.dart';
import 'package:frontend/screen/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screen/my_fridge/add_food_screen.dart';
import 'package:frontend/screen/search/search_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';

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
                : "Thêm đồ ăn",
            bgColor: MyColors.white['c900']!,
            rightIcon: MyIconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 28,
                )),
            leftIcon: MyIconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: MyColors.white['c900']!,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(spacing: 15, runSpacing: 5, children: [
                              ...foods
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
                                  .toList(),
                            ]),
                            const SizedBox(height: 10),
                            const MyDivider(),
                            const SizedBox(height: 10),
                            selectedFood != null
                                ? Wrap(spacing: 15, children: [
                                    ...selectedFood!.categories
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddFoodScreen(
                                                      type: selectedFood!.value,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: MyColors.grey['c100']!,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: MyColors
                                                            .grey['c300']!,
                                                        blurRadius: 4)
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  'assets/icons/i16/plus.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: MyText(
                                                text: 'Tạo',
                                                fontSize: FontSize.z12,
                                                fontWeight: FontWeight.w600,
                                                color: MyColors.grey['c700']!,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ])
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
