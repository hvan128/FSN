import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/components/item/item_ingredient.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/text.dart';

class MyKitchenDishes extends StatefulWidget {
  const MyKitchenDishes({super.key});

  @override
  State<MyKitchenDishes> createState() => _MyKitchenDishesState();
}

class _MyKitchenDishesState extends State<MyKitchenDishes> {
  List<Category> selectedCategories = [];
  List<Category> allCategories = [];
  List<Dish>? dishes;

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  void getAllCategories() async {
    List<Category> categories = await CategoryService().getAllCategories();
    setState(() {
      allCategories = categories;
      selectedCategories.add(categories[0]);
      selectedCategories.add(categories[1]);
      getAllDishes(categories[0].value!, categories[1].value!);
    });
  }

  Future<void> getAllDishes(String ingredient1, String ingredient2) async {
    List<Dish> dishes =
        await DishService.getDishByIngredient(ingredient1, ingredient2, 1, 10);
    setState(() {
      this.dishes = dishes;
    });
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
            width: 110 * allCategories.length / 2,
            child: Wrap(spacing: 8, runSpacing: 8, children: [
              ...allCategories
                  .map((e) => GestureDetector(
                      onTap: () {
                        if (selectedCategories.contains(e)) {
                          setState(() {
                            selectedCategories.remove(e);
                          });
                        } else {
                          if (selectedCategories.length == 2) {
                            FunctionCore.showSnackBar(
                                context, 'Chọn tối đa 2 nguyên liệu');
                          } else {
                            setState(() {
                              selectedCategories.add(e);
                            });
                          }
                        }
                        var ingredient1 = selectedCategories.isNotEmpty
                            ? selectedCategories[0].value!
                            : '';
                        var ingredient2 = selectedCategories.length == 2
                            ? selectedCategories[1].value!
                            : '';
                        getAllDishes(ingredient1, ingredient2);
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
                              FoodCard(
                                dish: e,
                              ),
                              const SizedBox(width: 10),
                            ],
                          ))
                      .toList(),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: MyColors.grey['c300']!,
                            )),
                        child: Image.asset('assets/icons/i16/arrow-left.png',
                            width: 25,
                            height: 25,
                            color: MyColors.grey['c700']!),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
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
