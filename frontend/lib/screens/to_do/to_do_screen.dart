// ignore_for_file: use_build_context_synchronously

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/to_do/drag_and_drop_list.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const TodoScreen({super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      floatingActionButton: FloatingActionButton(
        onPressed: () => addCategory(context),
        backgroundColor: MyColors.primary['CulturalYellow']!['c500']!,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: setListFood(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return DragNDropList(
                    listFoods: snapshot.data!,
                    showBottomBar: widget.showBottomBar,
                    navigateBottomBar: widget.navigateBottomBar,
                  );
                }
              })),
    );
  }

  void addCategory(BuildContext context) async {
    Loading.showLoading();
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SearchScreen(type: SearchType.shoppingList);
    }));
    final fridgeId =
        Provider.of<UserProvider>(context, listen: false).user!.fridgeId!;
    await ApiService.post(Config.CATEGORIES_API, {
      'label': result.label,
      'type': result.type,
      'icon': result.value,
      'value': result.value,
      'fridgeId': fridgeId,
      'positionId': 0
    });
    await APICacheManager().deleteCache('categories_0');
    await APICacheManager().deleteCache('categories');
    Loading.hideLoading();
    setState(() {});
  }

  Future<List<ItemFood>> setListFood() async {
    List<Category> categories =
        await CategoryService().getCategoriesByPosition(positionId: 0);
    return FunctionCore.getFoodList(categories);
  }
}
