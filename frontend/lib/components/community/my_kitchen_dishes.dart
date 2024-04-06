import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/components/item/item_ingredient.dart';
import 'package:frontend/screen/community/dish_detail_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/dish.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/text.dart';

class MyKitchenDishes extends StatefulWidget {
  const MyKitchenDishes({super.key});

  @override
  State<MyKitchenDishes> createState() => _MyKitchenDishesState();
}

class _MyKitchenDishesState extends State<MyKitchenDishes> {
  List<ItemCategory> selectedCategories = [];
  List<Dish>? dishes;

  @override
  void initState() {
    super.initState();
    dishes = listDishes;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyText(
              text: 'Cảm hứng từ nhà bếp của bạn',
              fontSize: FontSize.z18,
              fontWeight: FontWeight.w600,
              color: MyColors.grey['c800']!),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyText(
            text: 'Chọn đến 2 nguyên liệu',
            fontSize: FontSize.z14,
            fontWeight: FontWeight.w500,
            color: MyColors.grey['c600']!,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * meats.length / 6,
            child: Wrap(spacing: 8, runSpacing: 8, children: [
              ...meats
                  .map((e) => GestureDetector(
                      onTap: () {
                        if (selectedCategories.contains(e)) {
                          setState(() {
                            selectedCategories.remove(e);
                          });
                        } else {
                          setState(() {
                            selectedCategories.add(e);
                          });
                        }
                      },
                      child: ItemIngredient(
                          category: e,
                          isSelected: selectedCategories.contains(e))))
                  .toList(),
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: dishes != null && dishes!.isNotEmpty
              ? Row(children: [
                  ...dishes!
                      .map((e) => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DishDetailScreen(dish: e);
                                  }));
                                },
                                child: FoodCard(
                                    dish: e,
                                    onSave: () {
                                      setState(() {});
                                    }),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ))
                      .toList(),
                ])
              : Container(),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: MyColors.grey['c100']!,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/icons/i16/search.png',
                  width: 18,
                  height: 18,
                  color: MyColors.grey['c700'],
                ),
                const SizedBox(
                  width: 12,
                ),
                MyText(
                  text: 'Tìm những ý tưởng khác',
                  fontSize: FontSize.z16,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey['c700']!,
                )
              ]),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
