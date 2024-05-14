import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/provider/category.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/switch_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class ModalClassify extends StatefulWidget {
  const ModalClassify({super.key});

  @override
  State<ModalClassify> createState() => _ModalClassifyState();
}

enum SortType { label, expiryDate, manufactureDate}

class _ModalClassifyState extends State<ModalClassify> {
  bool? classify;
  SortType? sortType;

  @override
  void initState() {  
    super.initState();
    classify = Provider.of<CategoryProvider>(context, listen: false).classify;
    sortType = Provider.of<CategoryProvider>(context, listen: false).sortType;
    print(sortType?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
            height: 350,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(
                              text: 'Phân loại',
                              fontWeight: FontWeight.w500,
                              color: MyColors.grey['c700']!,
                              fontSize: FontSize.z18),
                          const Spacer(),
                          MySwitch(
                              value: classify!,
                              onChange: (value) {
                                setState(() {
                                  classify = value;
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      MyText(
                          text: 'Sắp xếp',
                          fontWeight: FontWeight.w500,
                          color: MyColors.grey['c700']!,
                          fontSize: FontSize.z18),
                      const SizedBox(height: 5),
                      ListTile(
                        title: const Text('Tên'),
                        leading: Radio<SortType>(
                          activeColor:
                              MyColors.primary['CulturalYellow']!['c600']!,
                          value: SortType.label,
                          groupValue: sortType,
                          onChanged: (SortType? value) {
                            setState(() {
                              sortType = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Ngày hết hạn'),
                        leading: Radio<SortType>(
                          activeColor:
                              MyColors.primary['CulturalYellow']!['c600']!,
                          value: SortType.expiryDate,
                          groupValue: sortType,
                          onChanged: (SortType? value) {
                            setState(() {
                              sortType = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Ngày tạo'),
                        leading: Radio<SortType>(
                          activeColor:
                              MyColors.primary['CulturalYellow']!['c600']!,
                          value: SortType.manufactureDate,
                          groupValue: sortType,
                          onChanged: (SortType? value) {
                            setState(() {
                              sortType = value;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: onPressDone,
                              child: MyText(
                                text: 'Xong',
                                fontWeight: FontWeight.w600,
                                fontSize: FontSize.z18,
                                color: MyColors.primary['CulturalYellow']!['c700']!,
                              )),
                        ],
                      )
                    ]),
              ),
            )),
      ),
    );
  }

  void onPressDone() {
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.sortTypeChange(value: sortType!);
    categoryProvider.classifyChange(value: classify!);
    CategoryService().deleteCache();
    Navigator.pop(context);
  }
}
