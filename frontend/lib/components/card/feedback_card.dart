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

enum FeedbackCardType { normal, small, large }

class FeedbackCard extends StatefulWidget {
  final FeedbackModel feedbackModel;
  final Dish? dish;
  final FeedbackCardType? type;
  const FeedbackCard({
    super.key,
    required this.feedbackModel,
    this.dish,
    this.type = FeedbackCardType.large,
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
    widget.feedbackModel.feels?.forEach((element) {
      print(element.toJson());
    });
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
      incrementQuantity(feel.type!, reactions);
    }
    for (Feel feel in feels) {
      if (feel.userId == userId) {
        setSelected(feel.type!, true, reactions);
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
                    'user': user,
                    'reactions': listReactions
                  }).then((_) => setState(() {}));
            },
            child: widget.type == FeedbackCardType.normal
                ? Container()
                : Container(
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
                              widget.feedbackModel.image!
                                      .startsWith('assets') !=
                                  true
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
                : widget.type == FeedbackCardType.normal
                    ? MediaQuery.of(context).size.width * 0.7
                    : 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterCommunity.feedbackDetail,
                                arguments: {
                                  'feedbackModel': widget.feedbackModel,
                                  'user': user,
                                  'reactions': listReactions
                                }).then((_) => setState(() {}));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: image,
                                      ),
                                      const SizedBox(width: 10),
                                      user == null
                                          ? Container()
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText(
                                                  text: user!.displayName!,
                                                  fontSize: FontSize.z12,
                                                  fontWeight: FontWeight.w400,
                                                  color: MyColors.grey['c700']!,
                                                ),
                                                widget.feedbackModel
                                                                .createdAt ==
                                                            null ||
                                                        widget.type ==
                                                            FeedbackCardType
                                                                .small
                                                    ? Container()
                                                    : MyText(
                                                        text: FunctionCore
                                                            .calculateDuration(
                                                                widget
                                                                    .feedbackModel
                                                                    .createdAt!),
                                                        fontSize: FontSize.z12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: MyColors
                                                            .grey['c700']!),
                                              ],
                                            )
                                    ]),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: MyText(
                                        text: widget.feedbackModel.content!,
                                        fontSize: FontSize.z13,
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.grey['c900']!,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
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
                                                                  .firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .value ==
                                                                          e.type),
                                                              quantity: e
                                                                  .quantity!
                                                                  .toString(),
                                                              isSelected:
                                                                  e.isSelected,
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                          ],
                                                        ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ]),
                                        !listReactions.every((reaction) =>
                                                reaction.quantity! > 0)
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
                              ),
                              const SizedBox(width: 3),
                              widget.type == FeedbackCardType.normal
                                  ? Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: widget.type ==
                                                FeedbackCardType.small
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              )
                                            : const BorderRadius.all(
                                                Radius.circular(8)),
                                        child: widget.feedbackModel.image !=
                                                    null &&
                                                widget.feedbackModel.image!
                                                        .startsWith('assets') !=
                                                    true
                                            ? Image.network(
                                                FunctionCore.convertImageUrl(
                                                    widget
                                                        .feedbackModel.image!),
                                                fit: BoxFit.cover)
                                            : Image.asset(
                                                widget.feedbackModel.image!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        widget.type == FeedbackCardType.small
                            ? Container()
                            : const SizedBox(height: 20),
                        widget.type == FeedbackCardType.small
                            ? Container()
                            : const MyDivider(
                                type: Type.solid,
                              ),
                        widget.type == FeedbackCardType.small
                            ? Container()
                            : const SizedBox(height: 10),
                        widget.type == FeedbackCardType.small
                            ? Container()
                            : originalDish(),
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
              child: widget.feedbackModel.ownerDishImage != null
                  ? Image.network(widget.feedbackModel.ownerDishImage!,
                      width: 20, height: 20)
                  : Image.asset('assets/icons/i16/image-default.png',
                      width: 20, height: 20),
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

  void onReactionChanged(EReaction reaction) async {
    print(reaction.name);
    print(listReactions
        .firstWhere((element) => element.type == reaction.name,
            orElse: () => Reaction())
        .isSelected);
    if (listReactions
            .firstWhere((element) => element.type == reaction.name,
                orElse: () => Reaction())
            .isSelected ==
        false) {
      final Feel feel = Feel(
        type: reaction.name,
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
        type: e.type,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: widget.feedbackModel.id,
      ));
    } else {
      setSelected(e.type!, false, listReactions);
      decrementQuantity(e.type!, listReactions);
      final feel = Feel(
        feedbackId: widget.feedbackModel.id,
        type: e.type,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
      );
      await DishService.deleteFeel(feel, 'feedback');
    }
    setState(() {});
  }

  void navigateToOriginalDish() async {
    final Dish dish =
        await DishService.getDishById(id: widget.feedbackModel.dishId!);

    Navigate.pushNamed(RouterCommunity.dishDetail, arguments: {'dish': dish});
  }
}
