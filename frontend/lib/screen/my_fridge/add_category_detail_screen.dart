import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/widgets/header.dart';

class AddCategoryDetailScreen extends StatelessWidget {
  final Category? category;

  const AddCategoryDetailScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(
          children: [
            MyHeader(
              title: "Add Category",
              bgColor: MyColors.white['c900']!,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: MyColors.white['c900']!,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Center(child: Text('${category?.label}'),)
                          ]
                        )
                    )
                  ]
                )
              )
                )
            )
          ]
        )
      )
    );
  }
}
