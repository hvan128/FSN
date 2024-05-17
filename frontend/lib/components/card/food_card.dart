import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/reaction_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

enum CardType { normal, small }

class FoodCard extends StatefulWidget {
  final Dish dish;
  final CardType? type;
  const FoodCard({
    super.key,
    required this.dish,
    this.type = CardType.normal,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool? isSaved = false;
  List<Reaction> listReactions = [
    Reaction(type: 'like', quantity: 0, isSelected: false),
    Reaction(type: 'love', quantity: 0, isSelected: false),
    Reaction(type: 'delicious', quantity: 0, isSelected: false),
  ];

  @override
  void initState() {
    super.initState();
    checkSaved();
    processFeels(
        widget.dish.feels!,
        Provider.of<UserProvider>(context, listen: false).user!.id!,
        listReactions);
  }

  void checkSaved() {
    List<Saved> savedList = widget.dish.saves!;
    for (Saved saved in savedList) {
      if (saved.userId ==
          Provider.of<UserProvider>(context, listen: false).user!.id!) {
        setState(() {
          isSaved = true;
        });
        break;
      }
    }
  }

  void processFeels(List<Feel> feels, int userId, List<Reaction> reactions) {
    for (Feel feel in feels) {
      incrementQuantity(feel.type!, reactions);
    }
    for (Feel feel in feels) {
      if (feel.userId == userId) {
        setSelected(feel.type!, true, reactions);
        break;
      }
    }
  }

  void incrementQuantity(String reactionType, List<Reaction> reactions) {
    Reaction? reactionToUpdate = reactions.firstWhere(
      (reaction) => reaction.type == reactionType,
      orElse: () => Reaction(),
    );

    reactionToUpdate.quantity = (reactionToUpdate.quantity ?? 0) + 1;
  }

  void decrementQuantity(String reactionType, List<Reaction> reactions) {
    Reaction? reactionToUpdate = reactions.firstWhere(
      (reaction) => reaction.type == reactionType,
      orElse: () => Reaction(),
    );

    reactionToUpdate.quantity = (reactionToUpdate.quantity ?? 0) - 1;
  }

  void setSelected(
      String reactionType, bool isSelected, List<Reaction> reactions) {
    Reaction? reactionToUpdate = reactions.firstWhere(
      (reaction) => reaction.type == reactionType,
      orElse: () => Reaction(),
    );

    reactionToUpdate.isSelected = isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final Image noImage = Image.asset(
      "assets/icons/i16/image-default.png",
      width: 30,
      height: 30,
    );
    final imageUrl = widget.dish.owner?.imageUrl;

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
                Navigator.pushNamed(context, RouterCommunity.dishDetail,
                    arguments: {
                      'dish': widget.dish,
                      'isSaved': isSaved,
                      'reactions': listReactions
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      isSaved = value as bool;
                    });
                  }
                  setState(() {});
                });
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
                  child: widget.dish.image != null &&
                          widget.dish.image!.startsWith('assets') != true
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
                                      child: image),
                                  const SizedBox(width: 10),
                                  widget.dish.owner == null
                                      ? Container()
                                      : MyText(
                                          text: widget.dish.owner!.username!,
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
                        child: GestureDetector(
                          onTap: onSave,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: isSaved == true
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
                                    widget.dish.owner == null
                                        ? Container()
                                        : MyText(
                                            text: widget.dish.owner!.username!,
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
                                      color: MyColors.grey['c800']!,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  widget.dish.createdAt == null
                                      ? Container()
                                      : MyText(
                                          text: FunctionCore.calculateDuration(
                                              widget.dish.createdAt!),
                                          fontSize: FontSize.z12,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.grey['c700']!),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                      Row(
                        children: [
                          Row(children: [
                            ...listReactions.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  onTapReactionItem(e);
                                },
                                child: Row(
                                  children: [
                                    e.quantity == 0
                                        ? Container()
                                        : Row(
                                            children: [
                                              ItemReaction(
                                                reaction: reactions.firstWhere(
                                                    (element) =>
                                                        element.value ==
                                                        e.type),
                                                quantity:
                                                    e.quantity!.toString(),
                                                isSelected: e.isSelected,
                                              ),
                                              const SizedBox(width: 5),
                                            ],
                                          ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ]),
                          !listReactions
                                  .every((reaction) => reaction.quantity! > 0)
                              ? ReactionButton(
                                  initialReaction: EReaction.none,
                                  onReactionChanged: (reaction) {
                                    onReactionChanged(reaction);
                                  },
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: onSave,
                      child: widget.type == CardType.normal
                          ? itemSave(isSaved ?? false)
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

  void onReactionChanged(EReaction reaction) async {
    if (listReactions
            .firstWhere((element) => element.type == reaction.name,
                orElse: () => Reaction())
            .isSelected ==
        false) {
      final Feel feel = Feel(
        type: reaction.name,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: widget.dish.id,
      );
      incrementQuantity(reaction.name, listReactions);
      setSelected(reaction.name, true, listReactions);
      await DishService.addFeel(feel, widget.dish.owner);
    }
    setState(() {});
  }

  void onSave() async {
    if (isSaved == true) {
      setState(() {
        isSaved = false;
      });
      await DishService.unSavedDish(Saved(
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: widget.dish.id,
      ));
    } else {
      setState(() {
        isSaved = true;
      });
      await DishService.saveDish(Saved(
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: widget.dish.id,
      ));
    }
  }

  void onTapReactionItem(Reaction e) async {
    if (e.isSelected == false) {
      setSelected(e.type!, true, listReactions);
      incrementQuantity(e.type!, listReactions);
      await DishService.addFeel(
          Feel(
            type: e.type,
            userId: Provider.of<UserProvider>(context, listen: false).user!.id,
            dishId: widget.dish.id,
          ),
          widget.dish.owner);
    } else {
      setSelected(e.type!, false, listReactions);
      decrementQuantity(e.type!, listReactions);
      final feel = Feel(
        dishId: widget.dish.id,
        type: e.type,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
      );
      await DishService.deleteFeel(feel, 'dish');
    }
    setState(() {});
  }
}
