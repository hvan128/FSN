import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/reaction_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class FeedbackDetailScreen extends StatefulWidget {
  const FeedbackDetailScreen({super.key});

  @override
  State<FeedbackDetailScreen> createState() => _FeedbackDetailScreenState();
}

class _FeedbackDetailScreenState extends State<FeedbackDetailScreen> {
  UserModel? user;
  bool isMine = false;
  FeedbackModel? feedbackModel;
  Image? userImage;
  Image? ownerImage;
  List<Reaction> listReactions = [
    Reaction(type: 'like', quantity: 0, isSelected: false),
    Reaction(type: 'love', quantity: 0, isSelected: false),
    Reaction(type: 'delicious', quantity: 0, isSelected: false),
  ];
  final Image noImage = Image.asset(
    "assets/icons/i16/logo.png",
    width: 40,
    height: 40,
  );

  @override
  void initState() {
    super.initState();
    feedbackModel = FeedbackModel();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        setState(() {
          feedbackModel = arguments['feedbackModel'];
          user = arguments['user'];
          if (arguments['reactions'] != null) {
            listReactions = arguments['reactions'];
          } else {
            processFeels(
                feedbackModel!.feels!,
                Provider.of<UserProvider>(context, listen: false).user!.id!,
                listReactions);
          }
          userImage = getImage(user!.imageUrl!);
          ownerImage = getImage(feedbackModel!.ownerDishImage);
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

  Image getImage(String? url) {
    if (url != null) {
      return Image.network(
        url,
        width: 40,
        height: 40,
        loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : const CircularProgressIndicator(),
        errorBuilder: (context, error, stackTrace) => noImage,
      );
    } else {
      return noImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                    expandedHeight: 400,
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
                              Image.asset(
                                'assets/icons/i16/upload.png',
                                width: 26,
                                height: 26,
                                color: MyColors.grey['c900'],
                              ),
                              const SizedBox(width: 20),
                              MyIconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/i16/dots-vertical.png',
                                      width: 25,
                                      height: 25,
                                      color: MyColors.grey['c900']!)),
                            ],
                          ),
                        ]),
                    automaticallyImplyLeading: false,
                    backgroundColor: MyColors.white['c900']!,
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                          feedbackModel != null && feedbackModel!.image != null
                              ? Image.network(
                                  FunctionCore.convertImageUrl(
                                      feedbackModel!.image!),
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                    )),
                SliverToBoxAdapter(
                  child: Column(children: [
                    feedbackModel != FeedbackModel()
                        ? originalDish()
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              isMine
                                  ? Navigate.pushNamed(RouterAccount.account)
                                  : Navigate.pushNamed(RouterAccount.friend,
                                      arguments: {'owner': user});
                            },
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: userImage),
                                  const SizedBox(width: 10),
                                  user == null || user == UserModel()
                                      ? const SizedBox()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                user!.displayName == null
                                                    ? const SizedBox()
                                                    : MyText(
                                                        text:
                                                            user!.displayName!,
                                                        fontSize: FontSize.z17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: MyColors
                                                            .grey['c900']!,
                                                      ),
                                                const SizedBox(width: 5),
                                                user!.username == null
                                                    ? const SizedBox()
                                                    : MyText(
                                                        text:
                                                            '@${user!.username!}',
                                                        fontSize: FontSize.z15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: MyColors
                                                            .grey['c700']!,
                                                      ),
                                              ],
                                            ),
                                            feedbackModel!.createdAt == null
                                                ? Container()
                                                : MyText(
                                                    text: FunctionCore
                                                        .calculateDuration(
                                                            feedbackModel!
                                                                .createdAt!),
                                                    fontSize: FontSize.z14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        MyColors.grey['c700']!),
                                          ],
                                        )
                                ]),
                          ),
                          const SizedBox(height: 10),
                          feedbackModel!.content == null
                              ? const SizedBox()
                              : MyText(
                                  text: feedbackModel!.content!,
                                  fontSize: FontSize.z17,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.grey['c800']!,
                                ),
                          const SizedBox(height: 10),
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
                              !listReactions.every(
                                      (reaction) => reaction.quantity! > 0)
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
                    const SizedBox(height: 10),
                    const MyDivider(type: Type.solid),
                    const SizedBox(height: 500),
                  ]),
                )
              ],
            ),
          ),
          commentInput(),
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
        feedbackId: feedbackModel!.id,
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
        feedbackId: feedbackModel!.id,
      ));
    } else {
      setSelected(e.type!, false, listReactions);
      decrementQuantity(e.type!, listReactions);
      final feel = Feel(
        feedbackId: feedbackModel!.id,
        type: e.type,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
      );
      await DishService.deleteFeel(feel, 'feedback');
    }
    setState(() {});
  }

  commentInput() {
    return Container();
  }

  originalDish() {
    return GestureDetector(
      onTap: navigateToOriginalDish,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: MyColors.grey['c100']!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            feedbackModel!.originalDish == null
                ? Container()
                : MyText(
                    text: feedbackModel!.originalDish!,
                    fontSize: FontSize.z16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey['c900']!),
            const SizedBox(height: 5),
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: feedbackModel!.ownerDishImage != null
                    ? Image.network(feedbackModel!.ownerDishImage!,
                        width: 25, height: 25)
                    : Image.asset('assets/icons/i16/image-default.png',
                        width: 25, height: 25),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  feedbackModel!.ownerDish == null
                      ? Container()
                      : MyText(
                          text: feedbackModel!.ownerDish!,
                          fontSize: FontSize.z15,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey['c700']!,
                        ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }

  void navigateToOriginalDish() async {
    final Dish dish = await DishService.getDishById(id: feedbackModel!.dishId!);
    Navigate.pushNamed(RouterCommunity.dishDetail, arguments: {'dish': dish});
  }
}
