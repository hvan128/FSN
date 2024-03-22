import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/dish.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/types/user.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/reaction_button.dart';
import 'package:frontend/widgets/text.dart';

enum CardType { normal, small }

class FoodCard extends StatefulWidget {
  final Dish dish;
  final Function()? onSave;
  final Function(Item)? onReactionChanged;
  final CardType? type;
  const FoodCard(
      {super.key,
      required this.dish,
      this.onSave,
      this.type = CardType.normal,
      this.onReactionChanged});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {

  @override
  Widget build(BuildContext context) {
    final User owner =
        users.firstWhere((owner) => owner.id == widget.dish.ownerId,
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
    List<Reaction> listReactions = widget.dish.reactions ??
        [Reaction(type: 'love', quantity: '0', isSelected: false)];
    final Image noImage = Image.asset(
      "assets/icons/i16/logo.png",
      width: 30,
      height: 30,
    );
    final imageUrl = owner.image;

    final Image image = (imageUrl != null)
        ? Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const CircularProgressIndicator(),
            errorBuilder: (context, error, stackTrace) => noImage,
          )
        : noImage;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.grey['c100']!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: widget.type == CardType.small
                  ? MediaQuery.of(context).size.width * 0.5 - 22
                  : 300,
              height: widget.type == CardType.small
                  ? MediaQuery.of(context).size.width * 0.4
                  : 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  widget.dish.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widget.type == CardType.small
                ? const SizedBox()
                : Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: MyColors.primary[
                                            'CulturalYellow']!['c700']!,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: image),
                                  const SizedBox(width: 10),
                                  MyText(
                                    text: owner.username,
                                    fontSize: FontSize.z12,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.white['c900']!,
                                  )
                                ]),
                                MyText(
                                  text: widget.dish.label,
                                  fontSize: FontSize.z22,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.white['c900']!,
                                ),
                              ],
                            ))),
                  ),
            widget.type == CardType.small
                ? Positioned.fill(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: widget.dish.isSaved != null &&
                                  widget.dish.isSaved!
                              ? Image.asset(
                                  'assets/icons/i16/save-book-mark.png',
                                  width: 30,
                                  height: 30,
                                  color: MyColors
                                      .primary['CulturalYellow']!['c700']!,
                                )
                              : Image.asset(
                                  'assets/icons/i16/bookmark-outline.png',
                                  width: 22,
                                  height: 22,
                                  color: MyColors.white['c900']!,
                                ),
                        )))
                : Container()
          ]),
          SizedBox(
            width: widget.type == CardType.small
                ? MediaQuery.of(context).size.width * 0.5 - 22
                : 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.type == CardType.normal
                          ? const SizedBox()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: MyColors.primary[
                                            'CulturalYellow']!['c700']!,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: image),
                                  const SizedBox(width: 5),
                                  MyText(
                                    text: owner.username,
                                    fontSize: FontSize.z12,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.grey['c700']!,
                                  )
                                ]),
                                MyText(
                                  text: widget.dish.label,
                                  fontSize: FontSize.z14,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.grey['c900']!,
                                ),
                                const SizedBox(height: 20),
                                MyText(
                                    text: '21 giờ trước',
                                    fontSize: FontSize.z12,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.grey['c700']!),
                                const SizedBox(height: 10),
                              ],
                            ),
                      Row(children: [
                        ...listReactions.map((e) {
                          return Row(
                            children: [
                              Row(
                                children: [
                                  e.quantity == '0'
                                      ? Container()
                                      : ItemReaction(
                                          reaction: reactions.firstWhere(
                                              (element) =>
                                                  element.value == e.type),
                                          quantity: e.quantity,
                                          isSelected: e.isSelected,
                                        ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                        listReactions.length < 3
                            ? ReactionButton(
                                initialReaction: EReaction.none,
                                onReactionChanged: (reaction) {
                                  print(reaction.name);
                                },
                              )
                            : const SizedBox(),
                      ]),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        widget.onSave?.call();
                      },
                      child: widget.type == CardType.normal
                          ? itemSave(widget.dish.isSaved ?? false)
                          : Container()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  EReaction? getFakeInitialReaction(int index) {
    if (index % 5 == 0) {
      return EReaction.like;
    } else if (index % 7 == 0) {
      return EReaction.love;
    } else if (index % 9 == 0) {
      return EReaction.delicious;
    }
    return null;
  }

  Widget itemSave(bool isSaved) {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 3, bottom: 3, left: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.grey['c100']!,
      ),
      child: Row(
        children: [
          Image.asset('assets/icons/i16/save-book-mark.png',
              width: 20,
              height: 20,
              color: isSaved
                  ? MyColors.primary['CulturalYellow']!['c600']!
                  : MyColors.grey['c600']!),
          const SizedBox(width: 6),
          MyText(
              text: isSaved ? 'Đã lưu' : 'Lưu',
              fontSize: FontSize.z12,
              fontWeight: FontWeight.w500,
              color: MyColors.grey['c600']!),
        ],
      ),
    );
  }
}
