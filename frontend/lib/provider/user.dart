import 'package:flutter/material.dart';
import 'package:frontend/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? user;
  UserProvider({this.user}); 

  void setUser({required UserModel user}) async {
    this.user = user;
    notifyListeners();
  }

  void setFridge({required int fridgeId}) async {
    if (user != null) {
      user!.fridgeId = fridgeId;
      notifyListeners();
    }
  }
  void deleteFridge() async {
    if (user != null) {
    user!.fridgeId = null; 
    notifyListeners(); 
  }
  }
}