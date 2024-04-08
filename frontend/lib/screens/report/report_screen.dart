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
import 'package:frontend/types/food.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

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
  @override
  void initState() {
    // TODO: implement initState
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
                return Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(snapshot.data![index]);
                          // CategoryItem(category: ItemCategory(
                          //   label: snapshot.data![index].label,
                          //   icon: snapshot.data![index].icon,
                          //   value: snapshot.data![index].value,
                          //   type: snapshot.data![index].type,
                          //   defaultDuration: 1,
                          // ));
                        }),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return Center(child: const CircularProgressIndicator());
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
          'label': 'gà',
          'manufactureDate': DateTime.now(),
          'expiryDate': DateTime.now().add(const Duration(days: 1)),
          'positionId': 1,
          'subPositionId': 1,
          'quantity': 2,
          'unit': '',
          'icon': 'ga',
          'value': '',
          'type': ''
        });
        if (!mounted) return;
        fetchCategory();
      }),
    );
  }
}
