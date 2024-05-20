import 'package:flutter/material.dart';
import 'package:frontend/components/card/search_food_card.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';

class SearchDishScreen extends StatefulWidget {
  const SearchDishScreen({super.key});

  @override
  State<SearchDishScreen> createState() => _SearchDishScreenState();
}

class _SearchDishScreenState extends State<SearchDishScreen> {
  TextEditingController searchTextController = TextEditingController();
  List<Dish>? dishes;

  @override
  void initState() {
    super.initState();
  }

  Future<void> setListDishes(String searchText) async {
    if (searchText == '') {
      setState(() {
        dishes = [];
      });
    } else {
      final res = await DishService.getDishByKeyword(keyword: searchText, page: 1, pageSize: 10);
      setState(() {
        dishes = res['dishes'] as List<Dish>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  child: TextField(
                    style: TextStyle(
                      fontSize: FontSize.z14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c900']!,
                    ),
                    autofocus: true,
                    onSubmitted: (value) => setListDishes(value),
                    controller: searchTextController,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchTextController.clear();
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          searchTextController.clear();
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              dishes == null ? Container() : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...dishes!.map((dish) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchFoodCard(dish: dish, keyword: searchTextController.text,),
                      ))
                    ]
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
