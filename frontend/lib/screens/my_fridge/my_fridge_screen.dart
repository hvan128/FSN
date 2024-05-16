import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/modal_classify.dart';
import 'package:frontend/components/modals/modal_filter.dart';
import 'package:frontend/components/modals/modal_select.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/navigation/router/settings.dart';
import 'package:frontend/provider/category.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/my_fridge/add_category_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class MyFridgeScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const MyFridgeScreen({super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<MyFridgeScreen> createState() => _MyFridgeScreenState();
}

class _MyFridgeScreenState extends State<MyFridgeScreen>
    with TickerProviderStateMixin {
  String selectedFilter = '';
  int selectedTabIndex = 0;
  bool isSelecting = false;
  List<int> isSelected = [];
  UserModel? user;
  late final TabController tabController;
  SortType? sortType;
  ViewType? viewType;
  bool? classify;
  int initialIndex = 1;
  Map<String, List<Category>> categoryMap = {};

  final List<Item> listPositions = [
    Item(
      label: "Tủ lạnh",
      value: '1',
    ),
    Item(
      label: "Tủ đông",
      value: '2',
    ),
    Item(
      label: "Bếp",
      value: '3',
    ),
    Item(
      label: "Khác",
      value: '0',
    )
  ];

  @override
  void initState() {
    super.initState();
    user = Provider.of<UserProvider>(context, listen: false).user;
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    sortType = categoryProvider.sortType;
    viewType = categoryProvider.viewType;
    classify = categoryProvider.classify;
    initialIndex = categoryProvider.positionTab;
    print('initialIndex: $initialIndex');
    tabController = TabController(length: 3, vsync: this, initialIndex: initialIndex - 1);
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    for (var element in listPositions) {
      await CategoryService()
          .getCategoriesByPosition(
              positionId: int.parse(element.value),
              sortType: sortType,
              sort: Sort.asc)
          .then((value) {
        if (mounted) {
          setState(() {
            categoryMap[element.value] = value;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isSelecting
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddCategoryScreen();
                }));
              },
              backgroundColor: MyColors.primary['CulturalYellow']!['c500']!,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
      body: Stack(children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            color: MyColors.primary['CulturalYellow']!['c700']!,
            child: SafeArea(
                child: Container(
              color: MyColors.primary['CulturalYellow']!['c50']!,
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTabBar(),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              MyColors.primary['CulturalYellow']!['c50']!,
                              MyColors.primary['CulturalYellow']!['c50']!
                                  .withOpacity(0.0),
                            ],
                            stops: const [
                              0.8,
                              1.0
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Flexible(
                              child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    _renderTab(1),
                                    _renderTab(2),
                                    _renderTab(3),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
        isSelected.isNotEmpty
            ? AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                bottom: isSelecting ? 0 : -70,
                child: _buildOptions(),
              )
            : const SizedBox(),
      ]),
    );
  }

  Widget _buildHeader() {
    return Stack(children: [
      Column(
        children: [
          Container(
            height: 90,
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
          const SizedBox(
            height: 25,
          )
        ],
      ),
      Positioned.fill(
          child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      isSelecting
                          ? GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                    'assets/icons/i16/close.png',
                                    width: 24,
                                    height: 24,
                                    color: MyColors.grey['c900']!,
                                  ),
                                ),
                              ),
                              onTap: () {
                                widget.showBottomBar?.call(true);
                                setState(() {
                                  isSelecting = !isSelecting;
                                });
                                isSelected.clear();
                              })
                          : MyIconButton(
                              onPressed: () {
                                onTapSetting();
                              },
                              icon: Icon(Icons.menu,
                                  color: MyColors.grey['c900']!),
                            ),
                      MyText(
                        text: isSelecting ? 'Đã chọn ${isSelected.length}' : '',
                        fontSize: FontSize.z16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.grey['c900']!,
                      ),
                    ],
                  ),
                  !isSelecting
                      ? Row(children: [
                          GestureDetector(
                            onTap: () {
                              widget.showBottomBar?.call(false);
                              setState(() {
                                isSelecting = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: MyColors.grey['c600']!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: MyText(
                                  text: 'Chọn',
                                  fontSize: FontSize.z15,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.white['c900']!),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: MyColors.grey['c600']!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                Icons.bubble_chart,
                                color: MyColors.white['c900'],
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                onTap: showModalClassify,
                                child: classifyButton(),
                              ),
                              PopupMenuItem(
                                value: 2,
                                onTap: showModalFilter,
                                child: filterButton(),
                              )
                            ],
                            child: Container(
                              decoration: BoxDecoration(
                                color: MyColors.grey['c600']!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                Icons.more_vert,
                                color: MyColors.white['c900']!,
                              ),
                            ),
                          ),
                        ])
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      )),
      Positioned.fill(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchScreen(type: SearchType.mine);
                }));
              },
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    text: 'Bạn đang muốn tìm kiếm thứ gì?',
                    fontSize: FontSize.z16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c500']!,
                  )
                ]),
              ),
            )),
      )),
    ]);
  }

  Widget classifyButton() {
    return Row(
      children: [
        MyText(
            text: 'Phân loại',
            fontWeight: FontWeight.w500,
            color: MyColors.grey['c700']!,
            fontSize: FontSize.z16),
        const SizedBox(
          width: 20,
        ),
        MyIconButton(
          icon: Icon(Icons.filter_list, color: MyColors.grey['c900']!),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget filterButton() {
    return Row(
      children: [
        MyText(
            text: 'Kiểu xem',
            fontWeight: FontWeight.w500,
            color: MyColors.grey['c700']!,
            fontSize: FontSize.z16),
        const SizedBox(
          width: 20,
        ),
        MyIconButton(
          icon: Icon(Icons.filter_alt, color: MyColors.grey['c900']!),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      tabs: const [
        Tab(
          text: 'Lạnh',
          icon: Icon(Icons.kitchen),
        ),
        Tab(
          text: 'Đông',
          icon: Icon(Icons.ac_unit),
        ),
        Tab(
          text: 'Bếp',
          icon: Icon(Icons.countertops),
        ),
      ],
    );
  }

  Future? futureCategory;

  Future<void> clearCache() async {
    await CategoryService().deleteCache();
  }

  Widget _renderTab(int positionId) {
    String getFoodLabel(String value) {
      return foods.firstWhere((element) => element.value == value).label;
    }

    List<Category>? listCategories = categoryMap[positionId.toString()];
    Map<String, List<Category>> groupedCategories = {};
    if (listCategories == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      for (var category in listCategories) {
        if (!groupedCategories.containsKey(category.type)) {
          groupedCategories[category.type!] = [];
        }
        groupedCategories[category.type]?.add(category);
      }
      return listCategories.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/i16/item-food.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: MyText(
                    text: 'Thức ăn của bạn đang chờ được cất giữ',
                    fontSize: FontSize.z18,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey['c900']!,
                  ),
                )
              ],
            ))
          : SingleChildScrollView(
              child: classify == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: groupedCategories.entries.map((food) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: MyText(
                                          text:
                                              '${getFoodLabel(food.key)} (${food.value.length})',
                                          fontSize: FontSize.z16,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.grey['c900']!,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: MyColors.grey['c100']!,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Wrap(
                                          spacing: 14,
                                          runSpacing: 5,
                                          children: food.value
                                              .map(
                                                  (category) => GestureDetector(
                                                      onTap: () {
                                                        if (isSelecting) {
                                                          if (isSelected
                                                              .contains(category
                                                                  .id)) {
                                                            setState(() {
                                                              isSelected.remove(
                                                                  category.id);
                                                            });
                                                          } else {
                                                            setState(() {
                                                              isSelected.add(
                                                                  category.id!);
                                                            });
                                                          }
                                                        } else {
                                                          
                                                          Navigator.pushNamed(
                                                              context,
                                                              RouterMyFridge
                                                                  .editCategoryDetail,
                                                              arguments: {
                                                                'category':
                                                                    category
                                                              });
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        widget.showBottomBar!(
                                                            false);
                                                        setState(() {
                                                          isSelected.add(
                                                              category.id!);
                                                          isSelecting = true;
                                                        });
                                                      },
                                                      child: CategoryItem(
                                                        category: category,
                                                        viewType: viewType,
                                                        isSelected:
                                                            isSelected.contains(
                                                                category.id!),
                                                      )))
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const MyDivider(),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }).toList())
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: MyColors.grey['c100']!,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Wrap(
                        spacing: 14,
                        runSpacing: 5,
                        children: listCategories
                            .map((category) => GestureDetector(
                                onTap: () {
                                  if (isSelecting) {
                                    if (isSelected.contains(category.id)) {
                                      setState(() {
                                        isSelected.remove(category.id);
                                      });
                                    } else {
                                      setState(() {
                                        isSelected.add(category.id!);
                                      });
                                    }
                                  } else {
                                    print(category.toJson());
                                    Navigator.pushNamed(context,
                                        RouterMyFridge.editCategoryDetail,
                                        arguments: {'category': category});
                                  }
                                },
                                onLongPress: () {
                                  widget.showBottomBar!(false);
                                  setState(() {
                                    isSelected.add(category.id!);
                                    isSelecting = true;
                                  });
                                },
                                child: CategoryItem(
                                  category: category,
                                  viewType: viewType,
                                  isSelected: isSelected.contains(category.id!),
                                )))
                            .toList(),
                      ),
                    ),
            );
    }
  }

  Widget _buildOptions() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.primary['CulturalYellow']!['c700']!,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  onTapMove();
                },
                child: _option('assets/icons/i16/save.png', 'Di chuyển')),
            GestureDetector(
                onTap: () {
                  onTapDelete();
                },
                child: _option('assets/icons/i16/delete.png', 'Xóa')),
          ]),
    );
  }

  Widget _option(String icon, String label) {
    return Column(
      children: [
        Image.asset(icon, width: 25, height: 25, color: MyColors.grey['c900']!),
        MyText(
            text: label,
            fontSize: FontSize.z12,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c900']!),
      ],
    );
  }

  void onTapMove() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ModalSelect(
              title: 'Di chuyển tới',
              options: listPositions,
              onSelectItem: (value) async {
                for (var element in isSelected) {
                  ApiService.put('${Config.CATEGORIES_API}/position',
                      {'id': element, 'positionId': value.value});
                }
                final isSelectedLength = isSelected.length;
                setState(() {
                  categoryMap.clear();
                  isSelecting = false;
                  isSelected.clear();
                });

                await clearCache();
                await fetchCategories();
                widget.showBottomBar!(true);
                Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (context) {
                      return MyAlert(
                        alertType: AlertType.success,
                        position: AlertPosition.topCenter,
                        title: 'Thành công',
                        description:
                            'Đã di chuyển $isSelectedLength đồ ăn tới ${value.label}!',
                      );
                    });
              });
        });
  }

  void onTapDelete() async {
    for (var element in isSelected) {
      categoryMap.clear();
      ApiService.delete('${Config.CATEGORIES_API}/$element');
    }
    final isSelectedLength = isSelected.length;
    setState(() {
      isSelecting = false;
      isSelected.clear();
    });
    await clearCache();
    await fetchCategories();
    widget.showBottomBar!(true);
    showDialog(
        context: context,
        builder: (context) {
          return MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description: 'Xóa $isSelectedLength đồ ăn khỏi tủ lạnh!',
          );
        });
  }

  void onTapSetting() {
    Navigate.pushNamed(RouterSetting.setting);
  }

  void showModalClassify() {
    showDialog(context: context, builder: (context) => const ModalClassify())
        .then((_) async {
      setState(() {
        classify =
            Provider.of<CategoryProvider>(context, listen: false).classify;
        sortType =
            Provider.of<CategoryProvider>(context, listen: false).sortType;
      });
      await clearCache();
      await fetchCategories();
    });
  }

  void showModalFilter() {
    showDialog(context: context, builder: (context) => const ModalFilter())
        .then((_) async {
      setState(() {
        viewType =
            Provider.of<CategoryProvider>(context, listen: false).viewType;
      });
    });
  }
}
