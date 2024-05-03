import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';

class DishDetailScreen extends StatefulWidget {
  const DishDetailScreen({super.key});

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  Dish? dish;
  UserModel? owner;
  Image? image;

  @override
  void initState() {
    super.initState();
    dish = Dish();
    owner = UserModel();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final arguments = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        dish = arguments['dish'];
        owner = arguments['owner'];
        final Image noImage = Image.asset(
          "assets/icons/i16/logo.png",
          width: 70,
          height: 70,
        );
        final imageUrl = owner!.imageUrl;
        image = (imageUrl != null)
            ? Image.network(
                imageUrl,
                width: 70,
                height: 70,
                loadingBuilder: (context, child, loadingProgress) =>
                    (loadingProgress == null)
                        ? child
                        : const CircularProgressIndicator(),
                errorBuilder: (context, error, stackTrace) => noImage,
              )
            : noImage;
            print(dish!.toJson());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset('assets/icons/i16/back.png',
                            width: 25,
                            height: 25,
                            color: MyColors.grey['c900']!)),
                    Row(
                      children: [
                        MyIconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/i16/camera.png',
                                width: 25,
                                height: 25,
                                color: MyColors.grey['c900']!)),
                        const SizedBox(width: 20),
                        MyIconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/icons/i16/bookmark-outline.png',
                                width: 25,
                                height: 25,
                                color: MyColors.grey['c900']!)),
                      ],
                    ),
                  ]),
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.white['c900']!,
              flexibleSpace: FlexibleSpaceBar(
                background: dish != null && dish!.image != null
                    ? Image.network(
                        FunctionCore.convertImageUrl(dish!.image!),
                        fit: BoxFit.cover,
                      )
                    : Container(),
              )),
          SliverToBoxAdapter(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        dish!.label == null
                            ? const SizedBox()
                            : Flexible(
                                child: MyText(
                                  text: dish!.label!,
                                  fontSize: FontSize.z30,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.grey['c900']!,
                                ),
                              ),
                        dish!.isSaved != null && dish!.isSaved!
                            ? Image.asset(
                                'assets/icons/i16/save-book-mark.png',
                                width: 25,
                                height: 25,
                                color: MyColors
                                    .primary['CulturalYellow']!['c700']!,
                              )
                            : Image.asset(
                                'assets/icons/i16/bookmark-outline.png',
                                width: 25,
                                height: 25,
                                color: MyColors.white['c900']!,
                              ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildAccount(),
                    const SizedBox(height: 10),
                    dish!.description == null
                        ? Container()
                        : MyText(
                            text: dish!.description!,
                            fontSize: FontSize.z16,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey['c800']!,
                          ),
                    const SizedBox(height: 20),
                    _buildTime(),
                    const SizedBox(height: 20),
                    _buildIngredients(),
                    const SizedBox(height: 20),
                    const MyDivider(
                      type: Type.solid,
                    ),
                    const SizedBox(height: 30),
                    _buildSteps(),
                    const MyDivider(
                      type: Type.solid,
                    ),
                    const SizedBox(height: 30),
                    _buildAccountSign(),
                    const SizedBox(height: 30),
                    const MyDivider(
                      type: Type.solid,
                    ),
                    const SizedBox(height: 30),
                    _buildReactions(),
                    const SizedBox(height: 30),
                    const MyDivider(
                      type: Type.solid,
                    ),
                    const SizedBox(height: 30),
                    _buildFeedback(),
                    const SizedBox(height: 30),
                    const MyDivider(
                      type: Type.solid,
                    ),
                    const SizedBox(height: 30),
                    _buildOwnerRecentDishes(),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildAccount() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(borderRadius: BorderRadius.circular(100), child: image),
      const SizedBox(width: 10),
      owner == null || owner == UserModel()
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                owner!.displayName == null
                    ? const SizedBox()
                    : MyText(
                        text: owner!.displayName!,
                        fontSize: FontSize.z17,
                        fontWeight: FontWeight.w600,
                        color: MyColors.grey['c900']!,
                      ),
                const SizedBox(height: 5),
                owner!.username == null
                    ? const SizedBox()
                    : MyText(
                        text: '@${owner!.username!}',
                        fontSize: FontSize.z13,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c700']!,
                      ),
                owner!.description == null
                    ? const SizedBox()
                    : MyText(
                        text: owner!.description!,
                        fontSize: FontSize.z13,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c700']!,
                      ),
                const SizedBox(height: 5),
                owner!.address == null
                    ? const SizedBox()
                    : Row(
                        children: [
                          Image.asset(
                            'assets/icons/i16/location.png',
                            width: 22,
                            height: 22,
                          ),
                          MyText(
                            text: owner!.address!,
                            fontSize: FontSize.z14,
                            fontWeight: FontWeight.w500,
                            color: MyColors.grey['c900']!,
                          ),
                        ],
                      ),
              ],
            )
    ]);
  }

  Widget _buildTime() {
    return Column(children: [
      const MyDivider(
        type: Type.solid,
      ),
      const SizedBox(height: 15),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/icons/i16/clock.png',
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 10),
          dish!.cookingTime == null
              ? Container()
              : MyText(
                  text: dish!.cookingTime!,
                  fontSize: FontSize.z15,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey['c700']!,
                )
        ]),
      ),
      const SizedBox(height: 15),
      const MyDivider(
        type: Type.solid,
      ),
    ]);
  }

  Widget _buildIngredients() {
    return dish!.ingredients == null
        ? Container()
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MyText(
              text: 'Nguyên liệu',
              fontSize: FontSize.z20,
              fontWeight: FontWeight.w600,
              color: MyColors.grey['c900']!,
            ),
            const SizedBox(height: 10),
            Row(children: [
              Image.asset(
                'assets/icons/i16/person.png',
                width: 22,
                height: 22,
              ),
              const SizedBox(width: 5),
              MyText(
                text: '${dish!.rangOfPeople} người',
                fontSize: FontSize.z14,
                fontWeight: FontWeight.w400,
                color: MyColors.grey['c700']!,
              )
            ]),
            const SizedBox(height: 20),
            ...dish!.ingredients!
                .map((ingredient) => Column(
                      children: [
                        const MyDivider(
                          type: Type.dotted,
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          MyText(
                            text: '${ingredient.quantity} ${ingredient.unit}',
                            fontSize: FontSize.z17,
                            fontWeight: FontWeight.w800,
                            color: MyColors.grey['c900']!,
                          ),
                          const SizedBox(width: 5),
                          MyText(
                            text: allCategories
                                .firstWhere(
                                    (category) =>
                                        category.value == ingredient.category,
                                    orElse: () => Category())
                                .label!,
                            fontSize: FontSize.z17,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey['c800']!,
                          )
                        ]),
                        const SizedBox(height: 10),
                      ],
                    ))
                .toList(),
          ]);
  }

  Widget _buildSteps() {
    return dish!.steps == null
        ? Container()
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MyText(
              text: 'Bước làm',
              fontSize: FontSize.z20,
              fontWeight: FontWeight.w600,
              color: MyColors.grey['c900']!,
            ),
            const SizedBox(height: 30),
            ...dish!.steps!
                .map((e) => Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: MyColors.grey['c700']!,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: MyText(
                                    text: '${e.no}',
                                    fontSize: FontSize.z15,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.white['c900']!,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: MyText(
                                  text: e.description!,
                                  fontSize: FontSize.z17,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.grey['c900']!,
                                ),
                              )
                            ]),
                        const SizedBox(height: 30),
                      ],
                    ))
                .toList(),
          ]);
  }

  Widget _buildAccountSign() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(100), child: image),
          const SizedBox(height: 10),
          MyText(
            text: 'Được đăng bởi',
            fontSize: FontSize.z15,
            fontWeight: FontWeight.w400,
            color: MyColors.grey['c700']!,
          ),
          const SizedBox(height: 10),
          owner == UserModel() || owner == null || owner!.displayName == null 
              ? Container()
              : MyText(
                  text: owner!.displayName!,
                  fontSize: FontSize.z17,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!,
                ),
          const SizedBox(height: 10),
          dish == null || dish!.createdAt == null ? Container() : MyText(
            text: FunctionCore.formatDate(dish!.createdAt!),
            fontSize: FontSize.z14,
            fontWeight: FontWeight.w500,
            color: MyColors.grey['c900']!,
          ),
          const SizedBox(height: 15),
          MyButton(text: 'Theo dõi', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildReactions() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(
        text: 'Những người khác đã bày tỏ cảm xúc',
        fontSize: FontSize.z14,
        fontWeight: FontWeight.w400,
        color: MyColors.grey['c600']!,
      ),
      const SizedBox(height: 10),
      // Row(children: [
      //   ...dish!.reactions!.map((e) {
      //     return Row(
      //       children: [
      //         Row(
      //           children: [
      //             e.quantity == '0'
      //                 ? Container()
      //                 : ItemReaction(
      //                     reaction: reactions
      //                         .firstWhere((element) => element.value == e.type),
      //                     quantity: e.quantity,
      //                     isSelected: e.isSelected,
      //                   ),
      //             const SizedBox(width: 5),
      //           ],
      //         ),
      //       ],
      //     );
      //   }).toList(),
      //   dish!.reactions!.length < 3
      //       ? ReactionButton(
      //           initialReaction: EReaction.none,
      //           onReactionChanged: (reaction) {
      //             print(reaction.name);
      //           },
      //         )
      //       : const SizedBox(),
      // ]),
    ]);
  }

  Widget _buildFeedback() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(
        text: 'Thành quả của bạn',
        fontSize: FontSize.z20,
        fontWeight: FontWeight.w600,
        color: MyColors.grey['c900']!,
      ),
      const SizedBox(height: 20),
      Row(children: [
        Flexible(
          child: MyText(
            text:
                'Bạn đã làm thử theo công thức này chưa? Cùng chia sẻ thành quả của mình với mọi người nhé!',
            fontSize: FontSize.z15,
            fontWeight: FontWeight.w400,
            color: MyColors.grey['c900']!,
          ),
        ),
        const SizedBox(width: 20),
        Image.asset(
          "assets/icons/i16/logo.png",
          width: 70,
          height: 70,
        )
      ]),
      const SizedBox(height: 20),
      Center(
          child: MyButton(text: 'Gửi Feedback', width: 200, onPressed: () {})),
    ]);
  }

  Widget _buildOwnerRecentDishes() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(
          'assets/icons/i16/logo.png',
          width: 70,
          height: 70,
        ),
        const SizedBox(height: 10),
        owner == UserModel()
            ? Container()
            : MyText(
                text: 'Món mới của ${owner!.username}',
                fontSize: FontSize.z20,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c700']!,
              ),
        const SizedBox(height: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 16,
            children: [
              ...listDishes
                  .map((dish) => FoodCard(
                        dish: dish,
                        type: CardType.small,
                      ))
                  .toList(),
            ],
          )
        ]),
      ]),
    );
  }
}
