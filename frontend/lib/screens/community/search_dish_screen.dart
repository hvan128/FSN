import 'package:flutter/material.dart';
import 'package:frontend/components/card/search_food_card.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/text.dart';

class SearchDishScreen extends StatefulWidget {
  const SearchDishScreen({super.key});

  @override
  State<SearchDishScreen> createState() => _SearchDishScreenState();
}

class _SearchDishScreenState extends State<SearchDishScreen>
    with TickerProviderStateMixin {
  TextEditingController searchTextController = TextEditingController();
  final controller = ScrollController();
  List<Dish> dishes = [];
  int? total;
  bool hasMore = true;
  bool isLoading = false;
  int selectedTabIndex = 0;
  String type = 'recipes';
  bool autoFocus = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        setState(() {
          searchTextController.text = arguments['searchText'];
          getAllDishes(searchTextController.text, 1, 10, type);
        });
      } else {
        setState(() {
          autoFocus = true;
        });
      }
      controller.addListener(() {
        if (controller.offset == controller.position.maxScrollExtent) {
          getAllDishes(
              searchTextController.text, dishes.length ~/ 10 + 1, 10, type);
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getAllDishes(
      String searchText, int page, int pageSize, String type) async {
    if (isLoading || !hasMore) {
      return;
    }
    isLoading = true;
    if (searchText == '') {
    } else {
      final res = await DishService.getDishByKeyword(
          keyword: searchText, page: page, pageSize: pageSize, type: type);
      setState(() {
        dishes.addAll(res['dishes']);
        total = res['total'];
        if (res['dishes'].length < pageSize - 3) {
          hasMore = false;
        }
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColors.primary['CulturalYellow']!['c50']!,
                    border: Border.all(
                      color: MyColors.grey['c100']!,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.grey['c500']!.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: FontSize.z14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c900']!,
                    ),
                    autofocus: ModalRoute.of(context)?.settings.arguments == null,
                    onSubmitted: (value) => {
                      setState(() {
                        dishes = [];
                        hasMore = true;
                        isLoading = false;
                      }),
                      getAllDishes(value, 1, 10, type)
                    },
                    controller: searchTextController,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      hintText: 'Tìm kiếm',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchTextController.clear();
                            dishes.clear();
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          searchTextController.clear();
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //     padding: EdgeInsets.symmetric(horizontal: 10),
              //     child: Container(
              //       padding: EdgeInsets.all(4),
              //       decoration: BoxDecoration(
              //           color: MyColors.primary["CulturalYellow"]!["c50"]!,
              //           borderRadius: BorderRadius.circular(8)),
              //       child: Row(
              //         children: [
              //           MyTabButton(
              //             title: 'Công thức nấu ăn',
              //             isSelected: selectedTabIndex == 0,
              //             onTap: () {
              //               setState(() {
              //                 selectedTabIndex = 0;
              //                 type = 'recipes';
              //                 dishes = [];
              //                 hasMore = true;
              //                 isLoading = false;
              //                 getAllDishes(
              //                     searchTextController.text, 1, 10, type);
              //               });
              //             },
              //           ),
              //           MyTabButton(
              //             title: 'Mẹo bếp',
              //             isSelected: selectedTabIndex == 1,
              //             onTap: () {
              //               setState(() {
              //                 selectedTabIndex = 1;
              //                 type = 'tips';
              //                 dishes = [];
              //                 hasMore = true;
              //                 isLoading = false;
              //                 getAllDishes(
              //                     searchTextController.text, 1, 10, type);
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //     )),
              // const SizedBox(
              //   height: 10,
              // ),
              // const SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child:
              //       Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              //     Image.asset('assets/icons/i16/dish.png',
              //         width: 28, height: 28),
              //     const SizedBox(width: 10),
              //     MyText(
              //         text: total.toString(),
              //         fontSize: FontSize.z18,
              //         fontWeight: FontWeight.w600,
              //         color: MyColors.grey['c900']!),
              //     MyText(
              //         text: ' công thức',
              //         fontSize: FontSize.z18,
              //         fontWeight: FontWeight.w600,
              //         color: MyColors.grey['c900']!),
              //   ]),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              isLoading
                  ? const SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ))
                  : dishes.isEmpty
                      ? buildNoResults()
                      : Expanded(
                          child: SingleChildScrollView(
                          controller: controller,
                          child: Column(children: [
                            ...dishes.map((dish) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SearchFoodCard(
                                    dish: dish,
                                    keyword: searchTextController.text,
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            hasMore
                                ? const Center(
                                    child: CircularProgressIndicator())
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
                          ]),
                        )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecipes() {
    return dishes.isEmpty
        ? Container()
        : Expanded(
            child: SingleChildScrollView(
            controller: controller,
            child: Column(children: [
              ...dishes.map((dish) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchFoodCard(
                      dish: dish,
                      keyword: searchTextController.text,
                    ),
                  )),
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
            ]),
          ));
  }

  Widget buildNoResults() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      width: double.infinity,
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
}
