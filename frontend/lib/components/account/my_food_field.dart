import 'package:flutter/cupertino.dart';
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
import 'package:frontend/utils/functions_core.dart';
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
  List<Dish>? drafts;
  int? totalDrafts;
  @override
  void initState() {
    super.initState();
    getAllRecipes(1, 5);
    getAllTips(1, 5);
    getAllDrafts(1, 20);
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

  Future<void> getAllDrafts(int page, int pageSize) async {
    final res1 = await DishService.getDishByOwnerId(
        widget.userId, page, pageSize, 'recipes', 'REJECTED');
    final res2 = await DishService.getDishByOwnerId(
        widget.userId, page, pageSize, 'tips', 'REJECTED');
    final res3 = await DishService.getDishByOwnerId(
        widget.userId, page, pageSize, 'recipes', 'PENDING');
    final res4 = await DishService.getDishByOwnerId(
        widget.userId, page, pageSize, 'tips', 'PENDING');
    setState(() {
      drafts =
          res1['dishes'] + res2['dishes'] + res3['dishes'] + res4['dishes'];
      drafts!.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
      totalDrafts =
          res1['total'] + res2['total'] + res3['total'] + res4['total'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        drafts == null || drafts!.isEmpty
            ? const SizedBox()
            : Container(
                color: MyColors.white['c900']!,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: '$totalDrafts món nháp',
                        fontSize: FontSize.z16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.grey['c900']!),
                    const SizedBox(height: 10),
                    _buildDrafts(drafts!),
                  ],
                )),
        const SizedBox(height: 10),
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
        tips == null || tips!.isEmpty
            ? _buildAddTipsButton()
            : Container(
                color: MyColors.white['c900']!,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                              icon: Image.asset('assets/icons/i16/search.png',
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
                                context, RouterCommunity.addDish,
                                arguments: {
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

  Widget _buildDrafts(List<Dish> dishes) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...dishes
                    .map((e) => Row(
                          children: [
                            draftDishCard(
                              e,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ))
                    .toList(),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ));
  }

  Widget draftDishCard(Dish dish) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigate.pushNamed(RouterCommunity.addDish, arguments: {
              'dish': dish,
              'type': 'edit',
            });
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.grey['c100']!,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.grey['c100']!,
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.network(
                        FunctionCore.convertImageUrl(dish.image!),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(height: 5),
                MyText(
                  text:
                      dish.type == 'tips' ? '[Mẹo] ${dish.label}' : dish.label!,
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c900']!,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: label(dish.status!),
          ),
        ),
      ],
    );
  }

  Widget label(String text) {
    Color getBgColor(String text) {
      switch (text) {
        case 'REJECTED':
          return MyColors.support['Error']!['c300']!;
        case 'APPROVED':
          return MyColors.green['EmeraldGreen']!['c200']!;
        case 'PENDING':
          return MyColors.primary['CulturalYellow']!['c500']!;
        default:
          return MyColors.transparent;
      }
    }

    Color getTextColor(String text) {
      switch (text) {
        case 'REJECTED':
          return MyColors.support['Error']!['c900']!;
        case 'APPROVED':
          return MyColors.green['EmeraldGreen']!['c500']!;
        case 'PENDING':
          return MyColors.grey['c900']!;
        default:
          return MyColors.transparent;
      }
    }

    String getText(String text) {
      switch (text) {
        case 'REJECTED':
          return 'Từ chối';
        case 'APPROVED':
          return 'Chấp nhận';
        case 'PENDING':
          return 'Chờ xét duyệt';
        default:
          return 'Đánh giá';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: getBgColor(text).withOpacity(0.5),
      ),
      child: MyText(
        text: getText(text),
        fontSize: FontSize.z10,
        fontWeight: FontWeight.w700,
        color: getTextColor(text),
      ),
    );
  }
}
