import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/screen/my_fridge/add_category_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/tab_button.dart';
import 'package:frontend/widgets/text.dart';

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
                    child: SingleChildScrollView(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  selectedTabIndex == 0
                                      ? _renderCoolTab()
                                      : selectedTabIndex == 1
                                          ? _renderFreezeTab()
                                          : _renderKitchenTab(),
                                ],
                              ),
                            ),
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
        Positioned(
          bottom: 20,
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
        )
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
              MyText(
                text: 'Chào Ngô Hải Văn',
                fontSize: FontSize.z16,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c900']!,
              ),
              Row(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.grey['c600']!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/icons/i16/three-dots.png',
                    width: 30,
                    height: 30,
                    color: MyColors.white['c900'],
                  ),
                ),
              ]),
            ],
          ),
        ),
      )),
      Positioned.fill(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                setState(() {
                  selectedTabIndex = 0;
                });
              },
            ),
            MyTabButton(
              title: 'Đông',
              isSelected: selectedTabIndex == 1,
              onTap: () {
                setState(() {
                  selectedTabIndex = 1;
                });
              },
            ),
            MyTabButton(
              title: 'Bếp',
              isSelected: selectedTabIndex == 2,
              onTap: () {
                setState(() {
                  selectedTabIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderCoolTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: foods.map((food) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //     width: 80,
                //     height: 80,
                //     padding: const EdgeInsets.all(5),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: MyColors.grey['c200']!,
                //     ),
                //     child: Image.asset(food.icon, width: 60, height: 60)),
                // const SizedBox(
                //   width: 10,
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: MyText(
                          text: '${food.label} (${food.categories.length})',
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
                          children: food.categories
                              .map((category) =>
                                  ItemCategory(category: category))
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
    );
  }

  Widget _renderKitchenTab() {
    return Container();
  }

  Widget _renderFreezeTab() {
    return Container();
  }
}
