import 'package:flutter/material.dart';
import 'package:frontend/components/card/my_food_card.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';

class MyFoodScreen extends StatefulWidget {
  const MyFoodScreen({super.key});

  @override
  State<MyFoodScreen> createState() => _MyFoodScreenState();
}

class _MyFoodScreenState extends State<MyFoodScreen> {
  List<Dish> dishes = [];
  int? userId;
  int? total;
  final controller = ScrollController();
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        setState(() {
          userId = arguments['userId'];
          getAllDishes(1, 10);
        });
        controller.addListener(() {
          if (controller.offset == controller.position.maxScrollExtent) {
            getAllDishes(dishes.length ~/ 10 + 1, 10);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getAllDishes(int page, int pageSize) async {
    if (isLoading || !hasMore) {
      return;
    }
        isLoading = true;

    final res = await DishService.getDishByOwnerId(userId!, page, pageSize);

    setState(() {
      dishes.addAll(res['dishes']);
      total = res['total'];
      if (res['dishes'].length < pageSize) {
        hasMore = false;
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(
          children: [
            MyHeader(
              title: 'Món của tôi',
              bgColor: MyColors.white['c900']!,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('assets/icons/i16/dish.png',
                                  width: 28, height: 28),
                              const SizedBox(width: 10),
                              MyText(
                                  text: total.toString(),
                                  fontSize: FontSize.z18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.grey['c900']!),
                              MyText(
                                  text: ' món',
                                  fontSize: FontSize.z18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.grey['c900']!),
                            ]),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: MyColors.grey['c300']!, width: 1),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: MyIconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/i16/search.png',
                                  width: 25,
                                  height: 25,
                                  color: MyColors.grey['c500']!)),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        children: [
                          ...dishes
                              .map((e) => Column(
                                    children: [
                                      MyFoodCard(dish: e),
                                      const SizedBox(height: 20),
                                    ],
                                  ))
                              .toList(),
                              const SizedBox(
                            height: 30,
                          ),
                          hasMore
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                child: MyText(
                                    text: 'Không còn món nào nữa',
                                    fontSize: FontSize.z18,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.grey['c800']!),
                              ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
