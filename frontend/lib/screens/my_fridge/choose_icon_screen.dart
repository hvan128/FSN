import 'package:flutter/material.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';

class ChooseIconScreen extends StatefulWidget {
  final String? type;
  const ChooseIconScreen({super.key, this.type});

  @override
  State<ChooseIconScreen> createState() => _ChooseIconScreenState();
}

class _ChooseIconScreenState extends State<ChooseIconScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    widget.type != null ? _scrollController.animateTo(
      _calculateScrollOffsetForIndex(widget.type!), // Replace 5 with the index you want to scroll to
      duration: const Duration(milliseconds: 500), // Adjust duration as needed
      curve: Curves.easeInOut, // Adjust curve as needed
    ) : null;
  });
  }

  double _calculateScrollOffsetForIndex(String type) {
    double totalOffset = 16;
    for (int i = 0; i < foods.length; i++) {
      if (foods[i].value == type) {
        return totalOffset;
      } else {
        totalOffset += _getItemHeight(foods[i].categories);
      }
    }
    return totalOffset;
  }

  double _getItemHeight(List<Category> categories) {
    return categories.length / 5 * 65 + 40;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(children: [
          MyHeader(
            bgUnderColor: MyColors.primary['CulturalYellow']!['c50']!,
            title: "Chọn biểu tượng",
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
            controller: _scrollController,
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
                            Column(children: [
                              const SizedBox(
                                height: 16,
                              ),
                              ...foods
                                  .map((e) => Column(
                                        children: [
                                          buildListIcon(e.categories),
                                          const SizedBox(height: 20),
                                          const MyDivider(),
                                          const SizedBox(height: 20),
                                        ],
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

  buildListIcon(List<Category> list) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: list
          .map((e) => GestureDetector(
                onTap: () => Navigator.pop(context, e.icon),
                child: Image.asset(e.icon ?? 'assets/icons/fruits/fruits.png',
                    width: 50, height: 50),
              ))
          .toList(),
    );
  }
}
