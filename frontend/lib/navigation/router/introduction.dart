import 'package:flutter/material.dart';
import 'package:frontend/screens/introduction/after_login_screen.dart';
import 'package:frontend/screens/introduction/create_fridge_screen.dart';
import 'package:frontend/screens/introduction/introduction_screen.dart';

class RouterIntroduction {
  static const String introduction = '/introduction';
  static const String createFridge = '/create-fridge';
  static const String afterLogin = '/after-login';
}

Map<String, WidgetBuilder> introductionRoutes = {
  RouterIntroduction.introduction: (context) => const IntroductionScreen(),
  RouterIntroduction.createFridge: (context) => const CreateFridgeScreen(),
  RouterIntroduction.afterLogin: (context) => const AfterLoginScreen(),
};