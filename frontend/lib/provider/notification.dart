import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  DateTime? dateTime;
  int notificationDaysInAdvance;
  bool getCommunityNotifications;
  bool getExpirationNotification;

  NotificationProvider(
      {this.dateTime,
      this.notificationDaysInAdvance = 0,
      this.getCommunityNotifications = true,
      this.getExpirationNotification = true});

  void setListFoods({required DateTime dateTime}) async {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void setDays({required int days}) {
    notificationDaysInAdvance = days;
    notifyListeners();
  }
  void setGetCommunityNotifications({required bool getCommunityNotifications}) {
    this.getCommunityNotifications = getCommunityNotifications;
    notifyListeners();
  }
  void setExpirationNotification({required bool getExpirationNotification}) {
    this.getExpirationNotification = getExpirationNotification;
    notifyListeners();
  }
}
