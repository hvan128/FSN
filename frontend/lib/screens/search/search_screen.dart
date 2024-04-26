import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_search.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screens/my_fridge/edit_category_detail_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:tiengviet/tiengviet.dart';

enum SearchType {
  mine,
  all,
}

class SearchScreen extends StatefulWidget {
  final SearchType? type;
  const SearchScreen({super.key, this.type = SearchType.all});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Category>? listCategories = [];
  List<Category>? categories = [];
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setListCategories('');
  }


  Future<void> setListCategories(String searchText) async {
    if (searchText == '') {
      categories = await CategoryService().getAllCategories();
      setState(() {
        listCategories = categories;
      });
    } else {
      listCategories = [];
      for (var element in categories!) {
        if (TiengViet.parse(element.label!)
            .toLowerCase()
            .contains(TiengViet.parse(searchText).toLowerCase())) {
          listCategories!.add(element);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: searchTextController,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setListCategories('');
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
                    onChanged: (value) {
                      setState(() {
                        searchTextController.text = value;
                      });
                      setListCategories(value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView(children: [
                ...listCategories!.map((category) {
                  return GestureDetector(
                      onTap: () {
                        Navigate.pushNamed(RouterMyFridge.editCategoryDetail,
                            arguments: {
                              'category': category
                            });
                      },
                      child: ItemSearch(
                          category: category,
                          type: widget.type ?? SearchType.all));
                })
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
