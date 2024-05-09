import 'package:flutter/material.dart';
import 'package:frontend/types/food.dart';

class CategoryProvider extends ChangeNotifier {
  List<ItemFood>? listFoods;
  CategoryProvider({this.listFoods}); 

  void setListFoods({required List<ItemFood> listFoods}) async {
    this.listFoods = listFoods;
    notifyListeners();
  }
}