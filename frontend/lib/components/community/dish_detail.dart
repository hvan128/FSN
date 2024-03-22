import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/dish.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/types/user.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/reaction_button.dart';
import 'package:frontend/widgets/text.dart';

class DishDetail extends StatefulWidget {
  final Dish dish;
  const DishDetail({super.key, required this.dish});

  @override
  State<DishDetail> createState() => _DishDetailState();
}

class _DishDetailState extends State<DishDetail> {
  User? owner;
  Image? image;
  @override
  void initState() {
    super.initState();
    owner = users.firstWhere((owner) => owner.id == widget.dish.ownerId,
        orElse: () => User(
              id: '0',
              username: 'john_doe',
              email: 'john.doe@example.com',
              image:
                  'https://www.facebook.com/photo?fbid=3516518468585687&set=a.1525178521053035',
              description: 'Hello, I am John Doe!',
              address: '123 Main Street, City, Country',
              phone: '+1234567890',
              birthday: '1990-01-01',
              gender: 'Male',
              role: 'User',
            ));
    final Image noImage = Image.asset(
      "assets/icons/i16/logo.png",
      width: 70,
      height: 70,
    );
    final imageUrl = owner?.image;

    image = (imageUrl != null)
        ? Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const CircularProgressIndicator(),
            errorBuilder: (context, error, stackTrace) => noImage,
          )
        : noImage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        widget.dish.image,
        fit: BoxFit.fitHeight,
        height: MediaQuery.of(context).size.height * 0.4,
      ),
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
                MyText(
                  text: widget.dish.label,
                  fontSize: FontSize.z32,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!,
                ),
                widget.dish.isSaved != null && widget.dish.isSaved!
                    ? Image.asset(
                        'assets/icons/i16/save-book-mark.png',
                        width: 30,
                        height: 30,
                        color: MyColors.primary['CulturalYellow']!['c700']!,
                      )
                    : Image.asset(
                        'assets/icons/i16/bookmark-outline.png',
                        width: 22,
                        height: 22,
                        color: MyColors.white['c900']!,
                      ),
              ],
            ),
            const SizedBox(height: 10),
            _buildAccount(),
            const SizedBox(height: 10),
            MyText(
              text: widget.dish.description!,
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
    ]);
  }

  Widget _buildAccount() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: BoxDecoration(
            color: MyColors.primary['CulturalYellow']!['c700']!,
            borderRadius: BorderRadius.circular(50),
          ),
          child: image),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: owner!.username,
            fontSize: FontSize.z17,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c900']!,
          ),
          const SizedBox(height: 5),
          MyText(
            text: owner!.description!,
            fontSize: FontSize.z13,
            fontWeight: FontWeight.w400,
            color: MyColors.grey['c700']!,
          ),
          const SizedBox(height: 5),
          Row(
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
          MyText(
            text: '${widget.dish.cookingTime!.toStringAsFixed(0)} phút',
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          text: '${widget.dish.rangOfPeople} người',
          fontSize: FontSize.z14,
          fontWeight: FontWeight.w400,
          color: MyColors.grey['c700']!,
        )
      ]),
      const SizedBox(height: 20),
      ...widget.dish.ingredients!
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
                              orElse: () => Category(
                                  label: '',
                                  value: '',
                                  icon: '',
                                  type: '',
                                  defaultDuration: 0))
                          .label,
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(
        text: 'Bước làm',
        fontSize: FontSize.z20,
        fontWeight: FontWeight.w600,
        color: MyColors.grey['c900']!,
      ),
      const SizedBox(height: 30),
      ...widget.dish.steps!
          .map((e) => Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: MyColors.grey!['c700']!,
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
                        text: e.description,
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
          Container(
              decoration: BoxDecoration(
                color: MyColors.primary['CulturalYellow']!['c700']!,
                borderRadius: BorderRadius.circular(50),
              ),
              child: image),
          const SizedBox(height: 10),
          MyText(
            text: 'Được đăng bởi',
            fontSize: FontSize.z15,
            fontWeight: FontWeight.w400,
            color: MyColors.grey['c700']!,
          ),
          const SizedBox(height: 10),
          MyText(
            text: owner!.username,
            fontSize: FontSize.z17,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c900']!,
          ),
          const SizedBox(height: 10),
          MyText(
            text: 'Vào ngày 21 tháng 10 năm 2023',
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
      Row(children: [
        ...widget.dish.reactions!.map((e) {
          return Row(
            children: [
              Row(
                children: [
                  e.quantity == '0'
                      ? Container()
                      : ItemReaction(
                          reaction: reactions
                              .firstWhere((element) => element.value == e.type),
                          quantity: e.quantity,
                          isSelected: e.isSelected,
                        ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          );
        }).toList(),
        widget.dish.reactions!.length < 3
            ? ReactionButton(
                initialReaction: EReaction.none,
                onReactionChanged: (reaction) {
                  print(reaction.name);
                },
              )
            : const SizedBox(),
      ]),
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
        MyText(
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
