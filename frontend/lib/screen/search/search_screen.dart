import 'package:flutter/material.dart';
import 'package:frontend/components/item/item_search.dart';
import 'package:frontend/screen/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/test_constants.dart';
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
  List<ItemCategory>? listCategories;
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setListCategories(searchTextController.text);
  }

  void setListCategories(String searchText) {
    if (searchText == '') {
      listCategories =
          widget.type == SearchType.mine ? listCategoriesTest : allCategories;
    } else {
      listCategories = [];
      if (widget.type == SearchType.mine) {
        for (var element in listCategoriesTest) {
          if (TiengViet.parse(element.label).contains(searchText)) {
            listCategories!.add(element);
          }
        }
      } else {
        for (var element in allCategories) {
          if (TiengViet.parse(element.label).contains(searchText)) {
            listCategories!.add(element);
          }
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
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AddCategoryDetailScreen(
                            category: category,
                          )
                        ));
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
