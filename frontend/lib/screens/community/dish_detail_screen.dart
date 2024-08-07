import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/card/feedback_card.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/components/item/item_reaction.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
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

class DishDetailScreen extends StatefulWidget {
  const DishDetailScreen({super.key});

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  Dish? dish;
  UserModel? owner;
  Image? image;
  List<Dish> relatedRecipes = [];
  List<Dish> relatedTips = [];
  int? totalRecipes;
  int? totalTips;
  int? totalFeedback;
  bool isMine = false;
  bool isSaved = false;
  List<Reaction> listReactions = [
    Reaction(type: 'like', quantity: 0, isSelected: false),
    Reaction(type: 'love', quantity: 0, isSelected: false),
    Reaction(type: 'delicious', quantity: 0, isSelected: false),
  ];
  List<FeedbackModel> listFeedbacks = [];

  Future<void> getAllDishes(int page, int pageSize) async {
    final res = await DishService.getDishByOwnerId(
        owner?.id!, page, pageSize, 'recipes');
    setState(() {
      relatedRecipes = res['dishes'];
      totalRecipes = res['total'];
    });
  }

  Future<void> getAllTips(int page, int pageSize) async {
    final res = await DishService.getDishByOwnerId(
        dish!.owner!.id!, page, pageSize, 'tips');

    setState(() {
      relatedTips = res['dishes'];
      totalTips = res['total'];
    });
  }

  Future<void> getAllFeedback(int page, int pageSize) async {
    final res =
        await DishService.getFeedbackByDishId(dish!.id!, page, pageSize);
    setState(() {
      listFeedbacks = res['feedbacks'];
      totalFeedback = res['total'];
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

  void checkSaved() {
    List<Saved> savedList = dish!.saves!;
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

  @override
  void initState() {
    super.initState();
    dish = Dish();
    owner = UserModel();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final arguments = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        dish = arguments['dish'];
        owner = dish!.owner;
        if (arguments['reactions'] != null) {
          listReactions = arguments['reactions'];
        } else {
          processFeels(
              dish!.feels!,
              Provider.of<UserProvider>(context, listen: false).user!.id!,
              listReactions);
        }
        if (arguments['isSaved'] != null) {
          isSaved = arguments['isSaved'];
        } else {
          checkSaved();
        }
        final Image noImage = Image.asset(
          "assets/icons/i16/image-default.png",
          width: 70,
          height: 70,
        );
        final imageUrl = owner?.imageUrl;
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
        getAllDishes(1, 4);
        getAllFeedback(1, 4);
        getAllTips(1, 4);
        isMine = dish!.owner?.id! ==
            Provider.of<UserProvider>(context, listen: false).user!.id!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context, isSaved);
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                leading: MyIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/icons/i16/back.png',
                        width: 25, height: 25, color: MyColors.grey['c900']!)),
                actions: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return MyNotification(
                              description:
                                  'Thêm tất cả các nguyên liệu vào danh sách mua sắm. Các món ăn đã có trong danh sách sẽ không được thêm vào.',
                              notificationType: NotificationType.info,
                              title: 'Thêm nhanh',
                              btnList: [
                                MyButton(
                                  text: 'Đồng ý',
                                  onPressed: () =>
                                      flashAddToShoppingList(context),
                                ),
                                MyButton(
                                    text: 'Quay lại danh sách',
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })
                              ],
                            );
                          });
                    },
                    icon: Image.asset(
                      'assets/icons/i16/flash-auto.png',
                      width: 26,
                      height: 26,
                      color: MyColors.grey['c900'],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/i16/camera.png',
                          width: 25,
                          height: 25,
                          color: MyColors.grey['c900']!)),
                  isMine
                      ? SubmenuButton(
                          menuChildren: <Widget>[
                            MenuItemButton(
                              onPressed: () {
                                onRemove();
                              },
                              child: const MenuAcceleratorLabel('&Xóa món ăn'),
                            ),
                            MenuItemButton(
                              onPressed: () {
                                Navigate.pushNamed(RouterCommunity.addDish,
                                    arguments: {
                                      'dish': dish,
                                      'type': 'edit',
                                    });
                              },
                              child: const MenuAcceleratorLabel(
                                  '&Chỉnh sửa món ăn'),
                            ),
                          ],
                          child: Icon(
                            Icons.more_vert,
                            color: MyColors.grey['c900']!,
                          ),
                        )
                      : IconButton(
                          onPressed: onSave,
                          icon: isSaved
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
                                  color: MyColors.grey['c900']!)),
                ],
                automaticallyImplyLeading: false,
                backgroundColor: MyColors.white['c900']!,
                flexibleSpace: FlexibleSpaceBar(
                  background: dish != null && dish!.image != null
                      ? GestureDetector(
                          onTap: () {
                            FunctionCore.showImageDetail(context,
                                FunctionCore.convertImageUrl(dish!.image!));
                          },
                          child: Image.network(
                            FunctionCore.convertImageUrl(dish!.image!),
                            fit: BoxFit.cover,
                          ),
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
                          GestureDetector(
                            onTap: onSave,
                            child: isSaved
                                ? Image.asset(
                                    'assets/icons/i16/save-book-mark.png',
                                    width: 30,
                                    height: 30,
                                    color: MyColors
                                        .primary['CulturalYellow']!['c700']!,
                                  )
                                : Image.asset(
                                    'assets/icons/i16/bookmark-outline.png',
                                    width: 30,
                                    height: 30,
                                    color: MyColors.grey['c900']!,
                                  ),
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
                      dish!.type != 'recipes'
                          ? Container()
                          : const SizedBox(height: 20),
                      dish!.type != 'recipes' ? Container() : _buildTime(),
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
      ),
    );
  }

  Widget _buildAccount() {
    return GestureDetector(
      onTap: () {
        isMine
            ? Navigate.pushNamed(RouterAccount.account)
            : Navigate.pushNamed(RouterAccount.friend,
                arguments: {'owner': owner});
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      ]),
    );
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
            dish!.type != 'recipes'
                ? Container()
                : Row(children: [
                    Image.asset(
                      'assets/icons/i16/person.png',
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 5),
                    dish!.rangeOfPeople == null
                        ? Container()
                        : MyText(
                            text: RegExp(r'^[\d-\s]+$')
                                    .hasMatch(dish!.rangeOfPeople!)
                                ? '${dish!.rangeOfPeople} người'
                                : dish!.rangeOfPeople!,
                            fontSize: FontSize.z14,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey['c700']!,
                          )
                  ]),
            dish!.type != 'recipes' ? Container() : const SizedBox(height: 20),
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
                                            category.value == ingredient.value,
                                        orElse: () => Category())
                                    .label ??
                                ingredient.label ??
                                '',
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    e.description == null
                                        ? Container()
                                        : MyText(
                                            text: e.description!,
                                            fontSize: FontSize.z17,
                                            fontWeight: FontWeight.w400,
                                            color: MyColors.grey['c900']!,
                                          ),
                                    const SizedBox(height: 10),
                                    e.image == null
                                        ? Container()
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            child: Image.network(
                                              FunctionCore.convertImageUrl(
                                                  e.image!),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
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
          GestureDetector(
              onTap: () {
                isMine
                    ? Navigate.pushNamed(RouterAccount.account)
                    : Navigate.pushNamed(RouterAccount.friend,
                        arguments: {'owner': owner});
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100), child: image)),
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
          dish == null || dish!.createdAt == null
              ? Container()
              : MyText(
                  text: FunctionCore.formatDate(dish!.createdAt!),
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c900']!,
                ),
          // const SizedBox(height: 15),
          // MyButton(text: 'Theo dõi', onPressed: () {}),
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
                                    (element) => element.value == e.type),
                                quantity: e.quantity!.toString(),
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
          !listReactions.every((reaction) => reaction.quantity! > 0)
              ? ReactionButton(
                  initialReaction: EReaction.none,
                  onReactionChanged: (reaction) {
                    onReactionChanged(reaction);
                  },
                )
              : const SizedBox(),
        ],
      ),
    ]);
  }

  Widget _buildFeedback() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          totalFeedback == 0
              ? MyText(
                  text: 'Thành quả của bạn',
                  fontSize: FontSize.z20,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!,
                )
              : MyText(
                  text: 'Thành quả của mọi người ( $totalFeedback )',
                  fontSize: FontSize.z20,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!,
                ),
          totalFeedback == 0
              ? Container()
              : IconButton(
                  onPressed: () {
                    listFeedbacks.clear();
                    Navigate.pushNamed(RouterCommunity.feedback,
                        arguments: {'dishId': dish!.id}).then((_) {
                      getAllFeedback(1, 4);
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: MyColors.grey['c900']!,
                  ))
        ],
      ),
      const SizedBox(height: 15),
      listFeedbacks.isNotEmpty
          ? feedback()
          : Row(children: [
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
          child: MyButton(
              text: 'Gửi Feedback',
              width: 200,
              onPressed: () {
                Navigator.pushNamed(context, RouterCommunity.addFeedback,
                        arguments: {'dishId': dish!.id})
                    .then((_) => getAllFeedback(1, 4));
              })),
    ]);
  }

  feedback() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listFeedbacks
              .map((e) => Row(
                    children: [
                      FeedbackCard(
                        feedbackModel: e,
                        type: FeedbackCardType.small,
                      ),
                      const SizedBox(width: 20),
                    ],
                  ))
              .toList(),
        ));
  }

  Widget _buildOwnerRecentDishes() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ClipRRect(borderRadius: BorderRadius.circular(100), child: image),
        const SizedBox(height: 10),
        owner == null
            ? Container()
            : MyText(
                text: dish!.type == 'recipes'
                    ? 'Món mới của ${owner!.displayName}'
                    : 'Các mẹo khác của ${owner!.displayName}',
                fontSize: FontSize.z20,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c700']!,
              ),
        const SizedBox(height: 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 16,
            children: [
              ...(dish!.type == 'recipes' ? relatedRecipes : relatedTips)
                  .map((dish) => FoodCard(
                        dish: dish,
                        type: CardType.small,
                      ))
                  .toList(),
            ],
          ),
          const SizedBox(height: 20),
          MyButton(
              text: 'Xem thêm',
              endIcon: Image.asset('assets/icons/i16/arrow-left.png',
                  width: 25, height: 25, color: MyColors.grey['c700']!),
              buttonType: ButtonType.transparent,
              onPressed: () {
                Navigate.pushNamed(RouterAccount.myFood,
                    arguments: {'userId': owner!.id});
              }),
          const SizedBox(height: 20),
        ]),
      ]),
    );
  }

  void flashAddToShoppingList(BuildContext context) async {
    Loading.showLoading();
    final List<Ingredient> ingredients = dish!.ingredients!;
    final fridgeId =
        Provider.of<UserProvider>(context, listen: false).user!.fridgeId!;
    for (var item in ingredients) {
      final category = allCategories.firstWhere(
          (element) => element.value == item.value,
          orElse: () => Category());
      final int length = await CategoryService().getShoppingListLength();
      if (category.value != null) {
        bool isExist = await checkCategoryIsExist(category.value!);
        if (!isExist) {
          await ApiService.post(Config.CATEGORIES_API, {
            'label': category.label,
            'type': category.type,
            'icon': category.icon,
            'value': category.value,
            'fridgeId': fridgeId,
            'positionId': 0,
            'no': length + 1
          });
          await APICacheManager().deleteCache('categories_0');
        }
      } else {
        final newCategory = Category(
          label: item.label,
          value: item.value,
        );
        bool isExist = await checkCategoryIsExist(newCategory.value!);
        if (!isExist) {
          await ApiService.post(Config.CATEGORIES_API, {
            'label': newCategory.label,
            'value': newCategory.value,
            'fridgeId': fridgeId,
            'positionId': 0,
            'no': length + 1
          });
          await APICacheManager().deleteCache('categories_0');
        }
      }
    }
    await APICacheManager().deleteCache('categories');
    Loading.hideLoading();
    Navigate.pop();
    showDialog(
        context: context,
        builder: (context) {
          return const MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description: 'Thêm nguyên liệu vào danh sách mua sắm thành công!',
          );
        });
  }

  Future<bool> checkCategoryIsExist(String category) async {
    bool isExist = false;
    List<Category> allCategories =
        await CategoryService().getCategoriesByPosition(positionId: 0);
    for (var item in allCategories) {
      if (item.value == category) {
        isExist = true;
        break;
      }
    }
    return isExist;
  }

  void onSave() async {
    if (isSaved == true) {
      setState(() {
        isSaved = false;
      });
      await DishService.unSavedDish(Saved(
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: dish!.id,
      ));
    } else {
      setState(() {
        isSaved = true;
      });
      await DishService.saveDish(Saved(
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: dish!.id,
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
            dishId: dish!.id,
          ),
          dish!.owner);
    } else {
      setSelected(e.type!, false, listReactions);
      decrementQuantity(e.type!, listReactions);
      final feel = Feel(
        dishId: dish!.id,
        type: e.type,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
      );
      await DishService.deleteFeel(feel, 'dish');
    }
    setState(() {});
  }

  void onReactionChanged(EReaction reaction) async {
    if (listReactions
            .firstWhere((element) => element.type == reaction.name)
            .isSelected ==
        false) {
      final Feel feel = Feel(
        type: reaction.name,
        userId: Provider.of<UserProvider>(context, listen: false).user!.id,
        dishId: dish!.id,
      );
      incrementQuantity(reaction.name, listReactions);
      setSelected(reaction.name, true, listReactions);
      await DishService.addFeel(feel, dish!.owner);
    }
    setState(() {});
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

  void onRemove() async {
    await DishService.deleteDish(dish!.id!);
    Navigate.pop();
    showDialog(
        context: context,
        builder: (context) {
          return const MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description: 'Xóa món ăn thành công!',
          );
        });
  }
}
