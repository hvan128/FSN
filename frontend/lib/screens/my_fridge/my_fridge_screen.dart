import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/modal_select.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screens/my_fridge/add_category_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/tab_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class MyFridgeScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const MyFridgeScreen({super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<MyFridgeScreen> createState() => _MyFridgeScreenState();
}

class _MyFridgeScreenState extends State<MyFridgeScreen> {
  String selectedFilter = '';
  int selectedTabIndex = 0;
  bool isSelecting = false;
  List<int> isSelected = [];
  UserModel? user;
  PageController pageController = PageController(initialPage: 0);
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              child: PageView(
                                  controller: pageController,
                                  onPageChanged: (value) => setState(() {
                                        selectedTabIndex = value;
                                      }),
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
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isSelecting && isSelected.isNotEmpty ? 70 : 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddCategoryScreen();
              }));
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: MyColors.primary['CulturalYellow']!['c700']!,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                'assets/icons/i16/add.png',
                color: MyColors.white['c900']!,
              ),
            ),
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
          child: Row(
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
                      : const SizedBox(),
                  MyText(
                    text: isSelecting
                        ? 'Đã chọn ${isSelected.length}'
                        : user != null && user!.displayName != null ? 'Chào ${user!.displayName}' : '',
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
                        child: Image.asset(
                          'assets/icons/i16/dots-vertical.png',
                          width: 30,
                          height: 30,
                          color: MyColors.white['c900'],
                        ),
                      ),
                    ])
                  : const SizedBox(),
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

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MyColors.primary['CulturalYellow']!['c100'],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            MyTabButton(
              title: 'Lạnh',
              isSelected: selectedTabIndex == 0,
              onTap: () {
                pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
            MyTabButton(
              title: 'Đông',
              isSelected: selectedTabIndex == 1,
              onTap: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
            MyTabButton(
              title: 'Bếp',
              isSelected: selectedTabIndex == 2,
              onTap: () {
                pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future? futureCategory;

  void fetchCategoryByPosition(int positionId) async {
    setState(() {
      // futureCategory = categoryDB.getCategories();
      futureCategory =
          ApiService.get('${Config.CATEGORIES_API}/position/$positionId');
    });
  }

  Widget _renderTab(int positionId) {
    return FutureBuilder(
      future: ApiService.get('${Config.CATEGORIES_API}/position/$positionId'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = jsonDecode(snapshot.data.toString());
          final listCategories = categoryFromJson(data['data']);
          Map<String, List<Category>> groupedCategories = {};

          for (var category in listCategories) {
            if (!groupedCategories.containsKey(category.type)) {
              groupedCategories[category.type!] = [];
            }
            groupedCategories[category.type]?.add(category);
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: groupedCategories.entries.map((food) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: MyText(
                                  text: '${food.key} (${food.value.length})',
                                  fontSize: FontSize.z16,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.grey['c900']!,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
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
                                  children: food.value
                                      .map((category) => GestureDetector(
                                          onTap: () {
                                            if (isSelecting) {
                                              if (isSelected
                                                  .contains(category.id)) {
                                                setState(() {
                                                  isSelected
                                                      .remove(category.id);
                                                });
                                              } else {
                                                setState(() {
                                                  isSelected.add(category.id!);
                                                });
                                              }
                                            } else {
                                              print(category.toJson());
                                              Navigator.pushNamed(
                                                  context,
                                                  RouterMyFridge
                                                      .editCategoryDetail,
                                                  arguments: {
                                                    'category': category
                                                  });
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
                                            isSelected: isSelected
                                                .contains(category.id!),
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
              }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

//   Widget _renderTab(List<ItemFood> foods) {
//   return CustomScrollView(
//     slivers: [
//       SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) {
//             final food = foods[index];
//             return Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: MyText(
//                               text: '${food.label} (${food.categories.length})',
//                               fontSize: FontSize.z16,
//                               fontWeight: FontWeight.w600,
//                               color: MyColors.grey['c900']!,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 10),
//                             decoration: BoxDecoration(
//                               color: MyColors.grey['c100']!,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Wrap(
//                               spacing: 14,
//                               runSpacing: 5,
//                               children: food.categories
//                                   .map((category) => GestureDetector(
//                                   onTap: () {
//                                     if (isSelecting) {
//                                       if (isSelected.contains(category)) {
//                                         setState(() {
//                                           isSelected.remove(category);
//                                         });
//                                       } else {
//                                         setState(() {
//                                           isSelected.add(category);
//                                         });
//                                       }
//                                     } else {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 AddCategoryDetailScreen(
//                                                   category: category,
//                                                 ),
//                                           ));
//                                     }
//                                   },
//                                   onLongPress: () {
//                                     widget.showBottomBar!(false);
//                                     setState(() {
//                                       isSelected.add(category);
//                                       isSelecting = true;
//                                     });
//                                   },
//                                   child: Text('abc')))
//                                   .toList(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const MyDivider(),
//                 const SizedBox(
//                   height: 10,
//                 )
//               ],
//             );
//           },
//           childCount: foods.length,
//         ),
//       ),
//     ],
//   );
// }

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
              onSelectItem: (value) {
                for (var element in isSelected) {
                  ApiService.put('${Config.CATEGORIES_API}/position',
                      {'id': element, 'positionId': value.value});
                }
                fetchCategoryByPosition(1);
                setState(() {
                  isSelecting = false;
                  isSelected.clear();
                });
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
                            'Đã di chuyển ${isSelected.length} đồ ăn tới ${value.label}!',
                      );
                    });
              });
        });
  }

  void onTapDelete() {
    for (var element in isSelected) {
      ApiService.delete('${Config.CATEGORIES_API}/$element').then((value) {
        showDialog(
            context: context,
            builder: (context) {
              return MyAlert(
                alertType: AlertType.success,
                position: AlertPosition.topCenter,
                title: 'Thành công',
                description: 'Xóa ${isSelected.length} đồ ăn khỏi tủ lạnh!',
              );
            });
      });
    }
    setState(() {
      isSelecting = false;
    });
    widget.showBottomBar!(true);
    fetchCategoryByPosition(1);
  }
}
