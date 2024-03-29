import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';

class MyFoodField extends StatefulWidget {
  const MyFoodField({super.key});

  @override
  State<MyFoodField> createState() => _MyFoodFieldState();
}

class _MyFoodFieldState extends State<MyFoodField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white['c900']!,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Image.asset('assets/icons/i16/dish.png', width: 25, height: 25),
              const SizedBox(width: 10),
              MyText(
                  text: '3',
                  fontSize: FontSize.z16,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!),
              MyText(
                  text: ' món',
                  fontSize: FontSize.z16,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!),
            ]),
            MyIconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/i16/search.png',
                    width: 25, height: 25, color: MyColors.grey['c900']!)),
          ]),
          const SizedBox(height: 20),
          _buildListDish(),
          const SizedBox(height: 20),
          MyButton(
            text: 'Xem tất cả các món',
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildListDish() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...listDishes
              .map((dish) => Row(
                    children: [
                      FoodCard(
                        dish: dish,
                        type: CardType.small,
                      ),
                      const SizedBox(width: 20),
                    ],
                  ))
              .toList(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: MyColors.grey['c300']!,
                )),
            child: Image.asset('assets/icons/i16/arrow-left.png',
                width: 25, height: 25, color: MyColors.grey['c700']!),
          ),
        ]));
  }
}
