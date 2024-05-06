import 'package:flutter/material.dart';
import 'package:frontend/screens/account/account_screen.dart';
import 'package:frontend/screens/account/friend_screen.dart';
import 'package:frontend/screens/account/my_food_screen.dart';
import 'package:frontend/screens/account/my_saved_food_screen.dart';

class RouterAccount {
  static const String account = '/account';
  static const String myFood = '/myFood';
  static const String friend = '/friend';
  static const String mySavedFood = '/mySavedFood';
}

Map<String, WidgetBuilder> accountRoutes = {
  RouterAccount.account: (context) => const AccountScreen(),
  RouterAccount.myFood: (context) => const MyFoodScreen(),
  RouterAccount.friend: (context) => const FriendScreen(),
  RouterAccount.mySavedFood: (context) => const MySavedFoodScreen(),
};