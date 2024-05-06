import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';

class MySavedDish extends StatefulWidget {
  final int userId;
  const MySavedDish({super.key, required this.userId});

  @override
  State<MySavedDish> createState() => _MySavedDishState();
}

class _MySavedDishState extends State<MySavedDish> {
  List<Dish>? dishes;
  int? total;
  @override
  void initState() {
    super.initState();
    getAllDishes(1, 5);
  }

  Future<void> getAllDishes(int page, int pageSize) async {
    final res = await DishService.getSavedDish(widget.userId, page, pageSize);
    setState(() {
      dishes = res['dishes'];
      total = res['total'];
    });
  }

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
                  text: total.toString(),
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
            onPressed: viewAll,
          )
        ],
      ),
    );
  }

  Widget _buildListDish() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: dishes == null
            ? Container()
            : Row(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ...dishes!
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
                  ]),
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
                ],
              ));
  }

  void viewAll() {
    Navigate.pushNamed(RouterAccount.mySavedFood,
        arguments: {'userId': widget.userId});
  }
}
