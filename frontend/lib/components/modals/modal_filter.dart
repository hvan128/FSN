import 'package:flutter/material.dart';
import 'package:frontend/provider/category.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class ModalFilter extends StatefulWidget {
  const ModalFilter({super.key});

  @override
  State<ModalFilter> createState() => _ModalFilterState();
}

enum ViewType { grid, list }

class _ModalFilterState extends State<ModalFilter> {
  ViewType? viewType;

  @override
  void initState() {
    super.initState();
    viewType = Provider.of<CategoryProvider>(context, listen: false).viewType;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
            height: 236,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          text: 'Kiểu xem',
                          fontWeight: FontWeight.w500,
                          color: MyColors.grey['c700']!,
                          fontSize: FontSize.z18),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text('Lưới'),
                        leading: Radio<ViewType>(
                          activeColor:
                              MyColors.primary['CulturalYellow']!['c600']!,
                          value: ViewType.grid,
                          groupValue: viewType,
                          onChanged: (ViewType? value) {
                            setState(() {
                              viewType = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Danh sách'),
                        leading: Radio<ViewType>(
                          activeColor:
                              MyColors.primary['CulturalYellow']!['c600']!,
                          value: ViewType.list,
                          groupValue: viewType,
                          onChanged: (ViewType? value) {
                            setState(() {
                              viewType = value;
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
                                color: MyColors
                                    .primary['CulturalYellow']!['c700']!,
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
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.viewTypeChange(value: viewType!);
    Navigator.pop(context);
  }
}
