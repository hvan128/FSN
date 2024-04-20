import 'package:flutter/material.dart';
import 'package:frontend/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? user;
  UserProvider({this.user}); 

  void setUser({required UserModel user}) async {
    this.user = user;
    notifyListeners();
  }
}