import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
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
  UserModel? owner;
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    await ApiService.get('${Config.USER_API}/${widget.dish.ownerId}')
        .then((value) {
      if (value != null) {
        setState(() {
          owner = UserModel.fromJson(jsonDecode(value)[0]);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Reaction> listReactions = [
      Reaction(type: 'love', quantity: '0', isSelected: false)
    ];
    final Image noImage = Image.asset(
      "assets/icons/i16/logo.png",
      width: 30,
      height: 30,
    );
    final imageUrl = owner?.imageUrl;

    final Image image = (imageUrl != null)
        ? Image.network(
            imageUrl,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                                      context, RouterCommunity.dishDetail,
                                      arguments: {'dish': widget.dish, 'owner': owner});
              },
              child: Container(
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
                  child: widget.dish.image != null && widget.dish.image!.startsWith('assets') != true
                      ? Image.network(
                          FunctionCore.convertImageUrl(widget.dish.image!),
                          fit: BoxFit.cover)
                      : Image.asset(
                          widget.dish.image!,
                          fit: BoxFit.cover,
                        ),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: image
                                  ),
                                  const SizedBox(width: 10),
                                  owner == null ? Container() : MyText(
                                    text: owner!.username!,
                                    fontSize: FontSize.z13,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.white['c900']!,
                                  )
                                ]),
                                Flexible(
                                  child: MyText(
                                    text: widget.dish.label!,
                                    fontSize: FontSize.z20,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.white['c900']!,
                                  ),
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
                          : SizedBox(
                              width: widget.type == CardType.small
                                  ? MediaQuery.of(context).size.width * 0.5 - 42
                                  : 300,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: image,
                                    ),
                                    const SizedBox(width: 5),
                                    owner == null ? Container() : MyText(
                                      text: owner!.username!,
                                      fontSize: FontSize.z12,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.grey['c700']!,
                                    )
                                  ]),
                                  Flexible(
                                    child: MyText(
                                      text: widget.dish.label!,
                                      fontSize: FontSize.z14,
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.grey['c900']!,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  widget.dish.createdAt == null ? Container() : MyText(
                                      text: FunctionCore.calculateDuration(widget.dish.createdAt!),
                                      fontSize: FontSize.z12,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.grey['c700']!),
                                  const SizedBox(height: 10),
                                ],
                              ),
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
