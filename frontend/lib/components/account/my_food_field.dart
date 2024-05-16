import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';

class MyFoodField extends StatefulWidget {
  final int userId;
  const MyFoodField({super.key, required this.userId});

  @override
  State<MyFoodField> createState() => _MyFoodFieldState();
}

class _MyFoodFieldState extends State<MyFoodField> {
  List<Dish>? recipes;
  int? totalRecipes;
  List<Dish>? tips;
  int? totalTips;
  @override
  void initState() {
    super.initState();
    getAllRecipes(1, 5);
    getAllTips(1, 5);
  }

  Future<void> getAllRecipes(int page, int pageSize) async {
    final res = await DishService.getDishByOwnerId(
        widget.userId, page, pageSize, 'recipes');
    setState(() {
      recipes = res['dishes'];
      totalRecipes = res['total'];
    });
  }

  Future<void> getAllTips(int page, int pageSize) async {
    final res = await DishService.getDishByOwnerId(
        widget.userId, page, pageSize, 'tips');

    setState(() {
      tips = res['dishes'];
      totalTips = res['total'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        recipes == null
            ? const Center(child: CircularProgressIndicator())
            : recipes!.isEmpty
                ? _buildAddRecipesButton()
                : Container(
                    color: MyColors.white['c900']!,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                            text: 'Công thức nấu ăn',
                            fontSize: FontSize.z20,
                            fontWeight: FontWeight.w600,
                            color: MyColors.grey['c900']!),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset('assets/icons/i16/dish.png',
                                        width: 25, height: 25),
                                    const SizedBox(width: 10),
                                    MyText(
                                        text: totalRecipes.toString(),
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
                                  onPressed: () {
                                    viewAll('recipes');
                                  },
                                  icon: Image.asset(
                                      'assets/icons/i16/search.png',
                                      width: 25,
                                      height: 25,
                                      color: MyColors.grey['c900']!)),
                            ]),
                        const SizedBox(height: 20),
                        _buildListDish(recipes, 'recipes'),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                              width: 200,
                              text: 'Viết món mới',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouterCommunity.addDish,
                                    arguments: {
                                      'dishType': 'recipes',
                                    });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
        const SizedBox(height: 10),
        tips == null
            ? Container()
            : tips!.isEmpty
                ? _buildAddTipsButton()
                : Container(
                    color: MyColors.white['c900']!,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                            text: 'Mẹo bếp',
                            fontSize: FontSize.z20,
                            fontWeight: FontWeight.w600,
                            color: MyColors.grey['c900']!),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset('assets/icons/i16/dish.png',
                                        width: 25, height: 25),
                                    const SizedBox(width: 10),
                                    MyText(
                                        text: totalTips.toString(),
                                        fontSize: FontSize.z16,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.grey['c900']!),
                                    MyText(
                                        text: ' mẹo',
                                        fontSize: FontSize.z16,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.grey['c900']!),
                                  ]),
                              MyIconButton(
                                  onPressed: () {
                                    viewAll('tips');
                                  },
                                  icon: Image.asset(
                                      'assets/icons/i16/search.png',
                                      width: 25,
                                      height: 25,
                                      color: MyColors.grey['c900']!)),
                            ]),
                        const SizedBox(height: 20),
                        _buildListDish(tips, 'tips'),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                              width: 200,
                              text: 'Thêm mẹo mới',
                              buttonType: ButtonType.secondary,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouterCommunity.addDish, arguments: {
                                  'dishType': 'tips',
                                    });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
      ],
    );
  }

  Widget _buildListDish(List<Dish>? dishes, String type) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: dishes == null
            ? Container()
            : Row(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ...dishes
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
                      GestureDetector(
                        onTap: () {
                          viewAll(type);
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                ],
              ));
  }

  void viewAll(String type) {
    Navigate.pushNamed(RouterAccount.myFood,
        arguments: {'userId': widget.userId, 'type': type});
  }

  Widget _buildAddRecipesButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      width: double.infinity,
      color: MyColors.white['c900']!,
      child: Column(children: [
        Image.asset('assets/images/new-food.png',
            width: 150, color: MyColors.grey['c900']!),
        const SizedBox(height: 10),
        MyText(
          text: 'Lưu trữ tất cả món bạn nấu ở cùng một nơi',
          fontSize: FontSize.z20,
          fontWeight: FontWeight.w600,
          color: MyColors.grey['c800']!,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        MyText(
          text: 'Và chia sẻ với gia đình & bạn bè',
          fontSize: FontSize.z16,
          fontWeight: FontWeight.w400,
          color: MyColors.grey['c600']!,
        ),
        const SizedBox(height: 15),
        MyButton(
          width: 200,
          text: 'Viết món mới',
          onPressed: () {
            Navigator.pushNamed(context, RouterCommunity.addDish, arguments: {
              'type': 'add',
              'dishType': 'recipes',
            });
          },
        )
      ]),
    );
  }

  Widget _buildAddTipsButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      width: double.infinity,
      color: MyColors.white['c900']!,
      child: Column(children: [
        Image.asset('assets/images/new-tips.png',
            width: 70, height: 100, color: MyColors.grey['c900']!),
        const SizedBox(height: 10),
        MyText(
          text: 'Chia sẻ những mẹo bếp hữu ích với mọi người',
          fontSize: FontSize.z20,
          fontWeight: FontWeight.w600,
          color: MyColors.grey['c800']!,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        MyText(
          text: 'Mẹo chế biến, bảo quản đồ ăn và nhiều hơn thế nữa',
          fontSize: FontSize.z16,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          color: MyColors.grey['c600']!,
        ),
        const SizedBox(height: 15),
        MyButton(
          width: 200,
          text: 'Thêm mẹo mới',
          buttonType: ButtonType.secondary,
          onPressed: () {
            Navigator.pushNamed(context, RouterCommunity.addDish, arguments: {
              'type': 'add',
              'dishType': 'tips',
            });
          },
        )
      ]),
    );
  }
}
