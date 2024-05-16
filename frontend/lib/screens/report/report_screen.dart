import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_category.dart';
import 'package:frontend/config.dart';
import 'package:frontend/database/category_db.dart';
import 'package:frontend/database/position_db.dart';
import 'package:frontend/database/sub_position_db.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/position.dart';
import 'package:frontend/models/sub_position.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class ReportScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const ReportScreen({super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  Future<List<Position>>? futurePosition;
  Future<List<SubPosition>>? futureSubPosition;
  Future? futureCategory;
  final positionDB = PositionDB();
  final subPositionDB = SubPositionDb();
  final categoryDB = CategoryDb();
  String selectedFilter = '';
  int selectedTabIndex = 0;
  bool isSelecting = false;
  List<Category> isSelected = [];
  @override
  void initState() {
    super.initState();
    fetchPosition();
    fetchSubPosition();
    fetchCategory();
  }

  void fetchPosition() async {
    setState(() {
      futurePosition = positionDB.getPositions();
    });
  }

  void fetchSubPosition() async {
    setState(() {
      futureSubPosition = subPositionDB.getSubPositions();
    });
  }

  void fetchCategory() async {
    setState(() {
      // futureCategory = categoryDB.getCategories();
      futureCategory = ApiService.get(Config.CATEGORIES_API);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: futureCategory,
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
                  children: groupedCategories.entries
                      .map(
                        (e) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: MyText(
                                      text: '${e.key} (${e.value.length})',
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
                                      children: e.value
                                          .map((category) => GestureDetector(
                                              onTap: () {
                                                if (isSelecting) {
                                                  if (isSelected
                                                      .contains(category)) {
                                                    setState(() {
                                                      isSelected
                                                          .remove(category);
                                                    });
                                                  } else {
                                                    setState(() {
                                                      isSelected.add(category);
                                                    });
                                                  }
                                                } else {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           AddCategoryDetailScreen(
                                                  //               category:
                                                  //                   category),
                                                  //     ));
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
                                                isSelected: isSelected
                                                    .contains(category),
                                              )))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // await categoryDB.addCategory(
        //     category: Category(
        //         label: 'gà',
        //         manufactureDate: DateTime.now(),
        //         expiryDate: DateTime.now().add(const Duration(days: 1)),
        //         positionId: 1,
        //         subPositionId: 1,
        //         quantity: 2,
        //         unit: '',
        //         icon: 'ga',
        //         value: '',
        //         type: ''));
        ApiService.post(Config.CATEGORIES_API, {
          'label': 'Ốc',
          'manufactureDate': DateTime.now().toIso8601String(),
          'expiryDate': DateTime.now()
              .subtract(const Duration(days: 3))
              
              .toIso8601String(),
          'positionId': 1,
          'subPositionId': 1,
          'quantity': 2,
          'unit': 'lit',
          'icon': 'oc',
          'value': 'tao',
          'type': 'vegetables',
        });
        if (!mounted) return;
        fetchCategory();
      }),
    );
  }
}
