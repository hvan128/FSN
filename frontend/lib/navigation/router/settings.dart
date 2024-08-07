import 'package:flutter/material.dart';
import 'package:frontend/screens/setting/fridge_family_screen.dart';
import 'package:frontend/screens/setting/notification_setting_screen.dart';
import 'package:frontend/screens/setting/qr_scanner_screen.dart';
import 'package:frontend/screens/setting/setting_screen.dart';

class RouterSetting {
  static const String setting = '/setting';
  static const String fridgeFamily = '/fridge_family';
  static const String qrScanner = '/qr_scanner';
  static const String notificationSetting = '/notification_setting';
}

Map<String, WidgetBuilder> settingRoutes = {
  RouterSetting.setting: (context) => const SettingScreen(),
  RouterSetting.fridgeFamily: (context) => const FridgeFamilySettingScreen(),
  RouterSetting.qrScanner: (context) => const QrScannerScreen(),
  RouterSetting.notificationSetting: (context) => const NotificationSettingScreen(),
};