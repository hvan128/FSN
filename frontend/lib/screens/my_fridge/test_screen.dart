import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/screens/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/test_constants.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';

class TestScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const TestScreen({super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  String selectedFilter = '';
  int selectedTabIndex = 0;
  bool isSelecting = false;
  List<ItemCategory> isSelected = [];
  final List<Item> listPositions = [
    Item(
      label: "Tủ lạnh",
      value: 'cool',
    ),
    Item(
      label: "Tủ đông",
      value: 'freeze',
    ),
    Item(
      label: "Bếp",
      value: 'kitchen',
    ),
    Item(
      label: "Khác",
      value: 'other',
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 125,
      //   flexibleSpace: _buildHeader(),
      //   bottom: TabBar(
      //     controller: _tabController,
      //     tabs: const <Widget>[
      //       Tab(
      //         text: 'Ngăn lạnh',
      //       ),
      //       Tab(
      //         text: 'Ngăn đông',
      //       ),
      //       Tab(
      //         text: 'Nhà bếp',
      //       ),
      //     ],
      //   ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      //   child: TabBarView(
      //     controller: _tabController,
      //     children: <Widget>[
      //       _renderTab(listFoodsTest),
      //       _renderTab(listFoodsTest2),
      //       _renderTab(listFoodsTest3),
      //     ],
      //   ),
      // ),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 150,
              floating: true,
              flexibleSpace: _buildHeader(),
              title: _title(),
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Ngăn lạnh',
                  ),
                  Tab(
                    text: 'Ngăn đông',
                  ),
                  Tab(
                    text: 'Nhà bếp',
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(controller: _tabController, children: <Widget>[
          _renderTab(listFoodsTest),
          _renderTab(listFoodsTest2),
          _renderTab(listFoodsTest3),
        ]),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            isSelecting
                ? GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: Image.asset(
                          'assets/icons/i16/close.png',
                          width: 16,
                          height: 16,
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
                  : 'Chào Ngô Hải Văn',
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
    );
  }

  Widget _searchBar() {
    return GestureDetector(
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
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: MyColors.primary['CulturalYellow']!['c800']!,
      child: SafeArea(
        child: Container(
          color: MyColors.primary['CulturalYellow']!['c50']!,
          child: Stack(children: [
            Container(
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
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 55, right: 20),
                      child: _searchBar(),
                    )))
          ]),
        ),
      ),
    );
  }

  Widget _renderTab(List<ItemFood> foods) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: foods.map((food) {
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
                                .map((category) => GestureDetector(
                                    onTap: () {
                                      if (isSelecting) {
                                        if (isSelected.contains(category)) {
                                          setState(() {
                                            isSelected.remove(category);
                                          });
                                        } else {
                                          setState(() {
                                            isSelected.add(category);
                                          });
                                        }
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddCategoryDetailScreen(
                                                      category: category),
                                            ));
                                      }
                                    },
                                    onLongPress: () {
                                      widget.showBottomBar!(false);
                                      setState(() {
                                        isSelected.add(category);
                                        isSelecting = true;
                                      });
                                    },
                                    child: CategoryItem(
                                      category: category,
                                      isSelected: isSelected.contains(category),
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
  }
}
