import 'package:flutter/material.dart';
import 'package:frontend/screens/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screens/my_fridge/add_category_screen.dart';
import 'package:frontend/screens/my_fridge/choose_icon_screen.dart';
import 'package:frontend/screens/my_fridge/choose_type_screen.dart';
import 'package:frontend/screens/my_fridge/create_new_category_screen.dart';
import 'package:frontend/screens/my_fridge/edit_category_detail_screen.dart';
import 'package:frontend/screens/my_fridge/message_screen.dart';
import 'package:frontend/screens/my_fridge/request_new_category.dart';

class RouterMyFridge {
  static const String addCategory = '/add-category';
  static const String addCategoryDetail = '/add-category-detail';
  static const String editCategoryDetail = '/edit-category-detail';
  static const String addFood = '/add-food';
  static const String createNewCategory = '/create-new-category';
  static const String chooseIcon = '/choose-icon';
  static const String chooseType = '/choose-type';
  static const String message = '/message';
  static const String requestNewCategory = '/request-new-category';
}

Map<String, WidgetBuilder> myFridgeRoutes = {
  RouterMyFridge.addCategory: (context) => const AddCategoryScreen(),
  RouterMyFridge.addCategoryDetail: (context) =>
      const AddCategoryDetailScreen(),
  RouterMyFridge.editCategoryDetail: (context) =>
      const EditCategoryDetailScreen(),
  RouterMyFridge.createNewCategory: (context) => const CreateNewCategoryScreen(),
  RouterMyFridge.chooseIcon: (context) => const ChooseIconScreen(),
  RouterMyFridge.chooseType: (context) => const ChooseTypeScreen(),
  RouterMyFridge.message: (context) => const MessageScreen(),
  RouterMyFridge.requestNewCategory: (context) => const RequestNewCategoryScreen(),
};