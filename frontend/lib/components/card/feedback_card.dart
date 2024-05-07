import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/reaction_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

enum FeedbackCardType { normal, small }

class FeedbackCard extends StatefulWidget {
  final FeedbackModel feedbackModel;
  final Dish? dish;
  final FeedbackCardType? type;
  const FeedbackCard({
    super.key,
    required this.feedbackModel,
    this.dish,
    this.type = FeedbackCardType.normal,
  });

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  UserModel? user;
  List<Reaction> listReactions = [
    Reaction(type: 'like', quantity: 0, isSelected: false),
    Reaction(type: 'love', quantity: 0, isSelected: false),
    Reaction(type: 'delicious', quantity: 0, isSelected: false),
  ];

  @override
  void initState() {
    super.initState();
    fetchUser();
    processFeels(
        widget.feedbackModel.feels!,
        Provider.of<UserProvider>(context, listen: false).user!.id!,
        listReactions);
  }

  void fetchUser() async {
    await ApiService.get('${Config.USER_API}/${widget.feedbackModel.userId}')
        .then((value) {
      if (value != null && value.isNotEmpty) {
        setState(() {
          user = UserModel.fromJson(jsonDecode(value)[0]);
        });
      }
    });
  }

  void processFeels(List<Feel> feels, int userId, List<Reaction> reactions) {
    for (Feel feel in feels) {
      switch (feel.type) {
        case 1:
          incrementQuantity('like', reactions);
          break;
        case 2:
          incrementQuantity('love', reactions);
          break;
        case 3:
          incrementQuantity('delicious', reactions);
          break;
      }

      if (feel.userId == userId) {
        switch (feel.type) {
          case 1:
            setSelected('like', true, reactions);
            break;
          case 2:
            setSelected('love', true, reactions);
            break;
          case 3:
            setSelected('delicious', true, reactions);
            break;
        }
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
    final imageUrl = user?.imageUrl;

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
      padding: widget.type == FeedbackCardType.small
          ? null
          : const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: widget.type == FeedbackCardType.small ? null : Colors.white,
        border: Border.all(
          color: MyColors.grey['c100']!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouterCommunity.feedbackDetail,
                  arguments: {
                    'feedbackModel': widget.feedbackModel,
                    'user': user
                  }).then((_) => setState(() {}));
            },
            child: Container(
              width: widget.type == FeedbackCardType.small
                  ? MediaQuery.of(context).size.width * 0.5 - 22
                  : 300,
              height: widget.type == FeedbackCardType.small
                  ? MediaQuery.of(context).size.width * 0.4
                  : 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: widget.type == FeedbackCardType.small
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )
                    : const BorderRadius.all(Radius.circular(8)),
                child: widget.feedbackModel.image != null &&
                        widget.feedbackModel.image!.startsWith('assets') != true
                    ? Image.network(
                        FunctionCore.convertImageUrl(
                            widget.feedbackModel.image!),
                        fit: BoxFit.cover)
                    : Image.asset(
                        widget.feedbackModel.image!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SizedBox(
            width: widget.type == FeedbackCardType.small
                ? MediaQuery.of(context).size.width * 0.5 - 22
                : 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: image,
                              ),
                              const SizedBox(width: 10),
                              user == null
                                  ? Container()
                                  : Column(
                                      children: [
                                        MyText(
                                          text: user!.displayName!,
                                          fontSize: FontSize.z12,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.grey['c700']!,
                                        ),
                                        widget.feedbackModel.createdAt ==
                                                    null ||
                                                widget.type ==
                                                    FeedbackCardType.small
                                            ? Container()
                                            : MyText(
                                                text: FunctionCore
                                                    .calculateDuration(widget
                                                        .feedbackModel
                                                        .createdAt!),
                                                fontSize: FontSize.z12,
                                                fontWeight: FontWeight.w400,
                                                color: MyColors.grey['c700']!),
                                      ],
                                    )
                            ]),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: MyText(
                                text: widget.feedbackModel.content!,
                                fontSize: FontSize.z14,
                                fontWeight: FontWeight.w600,
                                color: MyColors.grey['c900']!,
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
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
                                                  reaction: reactions
                                                      .firstWhere((element) =>
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
                        widget.type == FeedbackCardType.small ? Container() : const SizedBox(height: 20),
                        widget.type == FeedbackCardType.small ? Container() : const MyDivider(type: Type.solid, ),
                        widget.type == FeedbackCardType.small ? Container() : const SizedBox(height: 10),
                        widget.type == FeedbackCardType.small
                            ? Container()
                            : originalDish(),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget originalDish() {
    return GestureDetector(
      onTap: navigateToOriginalDish,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'BẢN GỐC',
            fontSize: FontSize.z12,
            fontWeight: FontWeight.w400,
            color: MyColors.grey['c700']!,
          ),
          const SizedBox(height: 5),
          MyText(
              text: widget.feedbackModel.originalDish!,
              fontSize: FontSize.z14,
              fontWeight: FontWeight.w600,
              color: MyColors.grey['c900']!),
          const SizedBox(height: 5),
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: widget.feedbackModel.ownerDishImage != null ? Image.network(widget.feedbackModel.ownerDishImage!,
                  width: 20, height: 20) : Image.asset('assets/icons/i16/image-default.png', width: 20, height: 20),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                MyText(
                  text: widget.feedbackModel.ownerDish!,
                  fontSize: FontSize.z12,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey['c700']!,
                ),
              ],
            )
          ]),
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

  void onReactionChanged(EReaction reaction) async {
    if (listReactions
            .firstWhere((element) => element.type == reaction.name,
                orElse: () => Reaction())
            .isSelected ==
        false) {
      final Feel feel = Feel(
        type: reaction.name == 'like'
            ? 1
            : reaction.name == 'love'
                ? 2
                : 3,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        feedbackId: widget.feedbackModel.id,
      );
      incrementQuantity(reaction.name, listReactions);
      setSelected(reaction.name, true, listReactions);
      await DishService.addFeel(feel);
    }
    setState(() {});
  }

  void onTapReactionItem(Reaction e) async {
    if (e.isSelected == false) {
      setSelected(e.type!, true, listReactions);
      incrementQuantity(e.type!, listReactions);
      await DishService.addFeel(Feel(
        type: e.type == 'like'
            ? 1
            : e.type == 'love'
                ? 2
                : 3,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: widget.feedbackModel.id,
      ));
    } else {
      setSelected(e.type!, false, listReactions);
      decrementQuantity(e.type!, listReactions);
      final feel = widget.feedbackModel.feels!.firstWhere((element) =>
          element.userId ==
              Provider.of<UserProvider>(context, listen: false).user!.id &&
          element.type ==
              (e.type == 'like'
                  ? 1
                  : e.type == 'love'
                      ? 2
                      : 3));
      await DishService.deleteFeel(feel);
    }
    setState(() {});
  }

  void navigateToOriginalDish() async {
    UserModel owner = UserModel();
    final Dish dish = await DishService.getDishById(id: widget.feedbackModel.dishId!);
    await ApiService.get('${Config.USER_API}/${dish.ownerId}').then((value) {
      if (value != null && value.isNotEmpty) {
        owner = UserModel.fromJson(jsonDecode(value)[0]);
      }
    });

    Navigate.pushNamed(RouterCommunity.dishDetail,
        arguments: {'dish': dish, 'owner': owner});
  }
}
