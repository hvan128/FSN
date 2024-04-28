import 'package:flutter/material.dart';
import 'package:frontend/screens/to_do/add_categories_screen.dart';

class RouterTodo {
  static const String addCategories = '/add-categories';
}

Map<String, WidgetBuilder> todoRoutes = {
  RouterTodo.addCategories: (context) => const AddCategoriesScreen(),
};