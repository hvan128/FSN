import 'package:flutter/material.dart';
import 'package:frontend/screens/to_do/add_categories_screen.dart';
import 'package:frontend/screens/to_do/preservation_category_screen.dart';

class RouterTodo {
  static const String addCategories = '/add-categories';
  static const String preservationCategory = '/preservation-category';
}

Map<String, WidgetBuilder> todoRoutes = {
  RouterTodo.addCategories: (context) => const AddCategoriesScreen(),
  RouterTodo.preservationCategory: (context) => const PreservationCategoryScreen(),
};