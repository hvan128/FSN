import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_food.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/header.dart';

class ChooseTypeScreen extends StatefulWidget {
  const ChooseTypeScreen({super.key});

  @override
  State<ChooseTypeScreen> createState() => _ChooseTypeScreenState();
}

class _ChooseTypeScreenState extends State<ChooseTypeScreen> {
  ItemFood? selectedFood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(children: [
          MyHeader(
            bgUnderColor: MyColors.primary['CulturalYellow']!['c50']!,
            title: "Chọn loại",
            bgColor: MyColors.white['c900']!,
            rightIcon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: Image.asset('assets/icons/i16/search.png',
                    width: 25, height: 25, color: MyColors.grey['c900']!)),
            leftIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: MyColors.grey['c900']!,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: MyColors.white['c900']!,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(spacing: 15, runSpacing: 5, children: [
                              ...foods
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context, e);
                                        },
                                        child: FoodItem(
                                            label: e.label,
                                            icon: e.icon,),
                                      ))
                                  .toList(),
                            ]),
                            const SizedBox(height: 30),
                          ]))
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }

}
