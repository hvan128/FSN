import 'package:flutter/material.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/navigation/router/auth.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/navigation/router/settings.dart';
import 'package:frontend/navigation/router/to_do.dart';
import 'package:frontend/screens/auth/create_id_screen.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/introduction/introduction_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RouterHome.home: (context) => const HomeScreen(),
  //* INTRODUCTION ROUTES */
  RouterIntroduction.introduction: (context) => const IntroductionScreen(),
  //* AUTH ROUTES */
  RouterAuth.login: (context) => const LoginScreen(),
  RouterAuth.register: (context) => const RegisterScreen(),
  RouterAuth.createId: (context) => const CreateIdScreen(),

  ...myFridgeRoutes,
  ...introductionRoutes,
  ...settingRoutes,
  ...todoRoutes,
  ...accountRoutes,
  ...communityRoutes,
};

Route<dynamic>? Function(RouteSettings)? onAnimateRoute = (settings) {
  switch (settings.name) {
    default:
      return null;
  }
};
