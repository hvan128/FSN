import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  DateTime? dateTime;
  NotificationProvider({this.dateTime}); 

  void setListFoods({required DateTime dateTime}) async {
    this.dateTime = dateTime;
    notifyListeners();
  }
}