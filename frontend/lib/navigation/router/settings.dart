import 'package:flutter/material.dart';
import 'package:frontend/screens/setting/fridge_family_screen.dart';
import 'package:frontend/screens/setting/setting_screen.dart';

class RouterSetting {
  static const String setting = '/setting';
  static const String fridgeFamily = '/fridge_family';
}

Map<String, WidgetBuilder> settingRoutes = {
  RouterSetting.setting: (context) => const SettingScreen(),
  RouterSetting.fridgeFamily: (context) => const FridgeFamilySettingScreen(),
};