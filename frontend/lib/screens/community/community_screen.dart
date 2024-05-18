import 'package:flutter/material.dart';
import 'package:frontend/components/card/feedback_card.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/components/card/food_card_loading.dart';
import 'package:frontend/components/community/my_kitchen_dishes.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/account/account_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final controller = ScrollController();
  List<Dish> recipes = [];
  List<Dish> relatedRecipes = [];
  List<Dish> tips = [];
  List<FeedbackModel> feedbacks = [];
  bool hasMore = true;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAllRelatedDishes(1, 10);
    getAllDishes(2, 10);
    getAllTips(1, 4);
    getAllFeedback(1, 4);
    controller.addListener(() {
      if (controller.offset == controller.position.maxScrollExtent) {
        getAllDishes((recipes.length + 6) ~/ 10 + 1, 10);
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
    List<Dish> newDishes =
        await DishService.getAllDish(page, pageSize, 'recipes');
    setState(() {
      recipes.addAll(newDishes);
      if (newDishes.length < pageSize) {
        hasMore = false;
      }
      isLoading = false;
    });
  }

  Future<void> getAllRelatedDishes(int page, int pageSize) async {
    List<Dish> newDishes =
        await DishService.getAllDish(page, pageSize, 'recipes');
    setState(() {
      relatedRecipes.addAll(newDishes.sublist(0, 4));
      recipes.addAll(newDishes.sublist(4));
    });
  }

  Future<void> getAllFeedback(int page, int pageSize) async {
    final res = await DishService.getAllFeedback(page, pageSize);
    setState(() {
      feedbacks.addAll(res);
    });
  }

  Future<void> getAllTips(int page, int pageSize) async {
    isLoading = true;
    List<Dish> newDishes = await DishService.getAllDish(page, pageSize, 'tips');
    setState(() {
      tips.addAll(newDishes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            floating: true,
            flexibleSpace: _buildHeader(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                    color: MyColors.white['c900']!,
                    child: const MyKitchenDishes()),
                const SizedBox(height: 10),
                recentTips(),
                const SizedBox(height: 10),
                relatedDishes(),
                const SizedBox(height: 10),
                recentFeedback(),
                const SizedBox(height: 10),
                recentRecipes()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget recentRecipes() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: MyColors.white['c900']!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyText(
                text: 'Công thức nấu ăn gần đây',
                fontSize: FontSize.z18,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c700']!),
          ),
          const SizedBox(
            height: 20,
          ),
          recipes.isEmpty
              ? loading()
              : Wrap(
                  spacing: 8,
                  runSpacing: 16,
                  children: [
                    ...recipes
                        .map((dish) => FoodCard(
                              dish: dish,
                              type: CardType.small,
                            ))
                        .toList(),
                  ],
                ),
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
                      color: MyColors.grey['c700']!),
                ),
          const SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Stack(children: [
      Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MyColors.primary['CulturalYellow']!['c600']!,
                    MyColors.primary['CulturalYellow']!['c600']!
                        .withOpacity(0.0),
                  ],
                  stops: const [
                    0.1,
                    1.0
                  ]),
            ),
          ),
        ],
      ),
      SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchScreen(type: SearchType.mine);
                }));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(children: [
                        Image.asset(
                          'assets/icons/i16/search.png',
                          width: 18,
                          height: 18,
                          color: MyColors.grey['c500'],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MyText(
                          text: 'Gõ vào tên các nguyên liệu...',
                          fontSize: FontSize.z13,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey['c500']!,
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AccountScreen();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          MyColors.primary['CulturalYellow']!['c600']!,
                      backgroundImage: user!.imageUrl == null
                          ? null
                          : NetworkImage((user.imageUrl!)),
                    ),
                  )
                ],
              ),
            )),
      ),
    ]);
  }

  loading() {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: MyColors.white['c900']!,
      child: Wrap(
        spacing: 8,
        runSpacing: 16,
        children: [
          ...List.generate(
              4,
              (index) => const FoodCardLoading(
                    type: CardType.small,
                  )).toList(),
        ],
      ),
    );
  }

  recentTips() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: MyColors.white['c900']!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyText(
                text: 'Mẹo bếp bạn phải biết',
                fontSize: FontSize.z18,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c700']!),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: tips == []
                  ? Container()
                  : Row(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...tips
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
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: MyColors.grey['c300']!,
                                    )),
                                child: Image.asset(
                                    'assets/icons/i16/arrow-left.png',
                                    width: 25,
                                    height: 25,
                                    color: MyColors.grey['c700']!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
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
                    text: 'Xem thêm các mẹo khác',
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
      ),
    );
  }
  recentFeedback() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: MyColors.white['c900']!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyText(
                text: 'Thành quả nấu ăn của mọi người',
                fontSize: FontSize.z18,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c700']!),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: feedbacks == []
                  ? Container()
                  : Row(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...feedbacks
                                  .map((feedback) => Row(
                                        children: [
                                          FeedbackCard(
                                            feedbackModel: feedback,
                                            type: FeedbackCardType.normal,
                                            
                                          ),
                                          const SizedBox(width: 20),
                                        ],
                                      ))
                                  .toList(),
                            ]),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: MyColors.grey['c300']!,
                                    )),
                                child: Image.asset(
                                    'assets/icons/i16/arrow-left.png',
                                    width: 25,
                                    height: 25,
                                    color: MyColors.grey['c700']!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
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
                    text: 'Xem thêm các mẹo khác',
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
      ),
    );
  }

  relatedDishes() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: MyColors.white['c900']!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyText(
                text: 'Món mới nhất',
                fontSize: FontSize.z18,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c700']!),
          ),
          const SizedBox(
            height: 20,
          ),
          relatedRecipes.isEmpty
              ? loading()
              : Wrap(
                  spacing: 8,
                  runSpacing: 16,
                  children: [
                    ...relatedRecipes
                        .map((dish) => FoodCard(
                              dish: dish,
                              type: CardType.small,
                            ))
                        .toList(),
                  ],
                ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
