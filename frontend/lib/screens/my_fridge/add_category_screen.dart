import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_food.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screens/my_fridge/create_new_category_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  Category? selectedCategory;
  ItemFood? selectedFood;
  List<ItemFood> listFoods = foods;
  @override
  void initState() {
    super.initState();
    selectedFood = null;
    selectedCategory = null;
    fetchNewCategory();
  }

  void fetchNewCategory() async {
    final fridgeId = Provider.of<UserProvider>(context, listen: false).user!.fridgeId!;
    final result = await CategoryService().getNewCategories(fridgeId);
    if (result.isNotEmpty) {
      for (var item in result) {
        listFoods
            .firstWhere((element) => element.value == item.type, orElse: () => listFoods.last)
            .categories
            .add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Column(children: [
          MyHeader(
            bgUnderColor: MyColors.primary['CulturalYellow']!['c50']!,
            title: selectedFood != null && selectedFood?.label != null
                ? selectedFood!.label
                : "Thêm đồ ăn",
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
                              ...listFoods
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedFood = e;
                                          });
                                        },
                                        child: FoodItem(
                                            label: e.label,
                                            icon: e.icon,
                                            isSelected: selectedFood == e),
                                      ))
                                  .toList(),
                            ]),
                            const SizedBox(height: 10),
                            const MyDivider(),
                            const SizedBox(height: 10),
                            selectedFood != null
                                ? Wrap(spacing: 15, children: [
                                    ...selectedFood!.categories
                                        .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedCategory = e;
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddCategoryDetailScreen(
                                                            category: e),
                                                  ));
                                            },
                                            child: FoodItem(
                                                label: e.label!,
                                                icon: e.icon!)))
                                        .toList(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateNewCategoryScreen(
                                                      type: selectedFood!.value,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: MyColors.grey['c100']!,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: MyColors
                                                            .grey['c300']!,
                                                        blurRadius: 4)
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  'assets/icons/i16/add.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: MyText(
                                                text: 'Tạo',
                                                fontSize: FontSize.z12,
                                                fontWeight: FontWeight.w600,
                                                color: MyColors.grey['c700']!,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ])
                                : Container()
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
