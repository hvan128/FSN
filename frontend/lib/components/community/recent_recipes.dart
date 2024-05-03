import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/text.dart';

class RecentRecipes extends StatefulWidget {
  const RecentRecipes({super.key});

  @override
  State<RecentRecipes> createState() => _RecentRecipesState();
}

class _RecentRecipesState extends State<RecentRecipes> {
    List<Dish>? dishes;
     @override
  void initState() {
    super.initState();
    getAllDishes(1, 10);
  }

   Future<void> getAllDishes(int page, int pageSize) async {
    List<Dish> dishes =
        await DishService.getAllDish(page, pageSize);
    setState(() {
      this.dishes = dishes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyText(
              text: 'Công thức nấu ăn gần đây',
              fontSize: FontSize.z18,
              fontWeight: FontWeight.w600,
              color: MyColors.grey['c800']!),
        ),
        const SizedBox(
          height: 20,
        ),
        dishes == null ? Container() : Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            ...dishes!.map((dish) => FoodCard(dish: dish, type: CardType.small,)).toList(),
          ],
        )
        ]
      ),
    );
  }
}