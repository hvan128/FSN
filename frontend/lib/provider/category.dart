import 'package:flutter/material.dart';
import 'package:frontend/components/modals/modal_classify.dart';
import 'package:frontend/components/modals/modal_filter.dart';

class CategoryProvider extends ChangeNotifier {
  SortType sortType;
  ViewType viewType;
  bool classify;
  int positionTab;
  CategoryProvider(
      {this.sortType = SortType.expiryDate,
      this.viewType = ViewType.grid,
      this.positionTab = 1,
      this.classify = true});

  void classifyChange({required bool value}) {
    classify = value;
  }
  void viewTypeChange({required ViewType value}) {
    viewType = value;
  }
  void sortTypeChange({required SortType value}) {
    sortType = value;
  }
  void positionTabChange({required int value}) {
    positionTab = value;
    print(positionTab);
  }
}
