import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';

class AddCategoryDetailScreen extends StatelessWidget {
  final Category? category;

  const AddCategoryDetailScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final type =
        foods.firstWhere((element) => element.value == category?.type).label;
    return Scaffold(
        backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
        body: SafeArea(
            child: Column(children: [
          MyHeader(
            title: "Add Category",
            bgColor: MyColors.white['c900']!,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: MyColors.white['c900']!,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: MyColors
                                          .primary['CulturalYellow']!['c100']!,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: MyColors.grey['c300']!,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: MyColors.grey['c300']!,
                                          blurRadius: 2,
                                          offset: const Offset(1, 2),
                                        )
                                      ]),
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      category!.icon,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 80,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: type,
                                            fontSize: FontSize.z16,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.grey['c900']!,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          MyText(
                                            text: category!.label,
                                            fontSize: FontSize.z18,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.grey['c900']!,
                                          )
                                        ]),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                              const MyDivider(),
                              const SizedBox(
                                height: 10,
                              ),
                            ]))
                      ]))))
        ])));
  }
}
