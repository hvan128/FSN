import 'package:flutter/material.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/navigation/router/auth.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/screens/account/account_screen.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:frontend/screens/community/add_dish_screen.dart';
import 'package:frontend/screens/community/dish_detail_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/introduction/introduction_screen.dart';
import 'package:frontend/screens/my_fridge/add_category_detail_screen.dart';
import 'package:frontend/screens/my_fridge/add_category_screen.dart';
import 'package:frontend/screens/my_fridge/add_food_screen.dart';
import 'package:frontend/screens/my_fridge/edit_category_detail_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RouterHome.home: (context) => const HomeScreen(),
  RouterAccount.account: (context) => const AccountScreen(),
  //* INTRODUCTION ROUTES */
  RouterIntroduction.introduction: (context) => const IntroductionScreen(),
  //* AUTH ROUTES */
  RouterAuth.login: (context) => const LoginScreen(),
  RouterAuth.register: (context) => const RegisterScreen(),
  //** COMMUNITY ROUTES */
  RouterCommunity.addDish: (context) => const AddDishScreen(),
  RouterCommunity.dishDetail: (context) => const DishDetailScreen(),
  //** MY FRIDGE ROUTES */
  RouterMyFridge.addCategory: (context) => const AddCategoryScreen(),
  RouterMyFridge.addCategoryDetail: (context) => const AddCategoryDetailScreen(),
  RouterMyFridge.editCategoryDetail: (context) => const EditCategoryDetailScreen(),
  RouterMyFridge.addFood: (context) => const AddFoodScreen(),
  
};

Route<dynamic>? Function(RouteSettings)? onAnimateRoute = (settings) {
  switch (settings.name) {
    default:
      return null;
  }
};
