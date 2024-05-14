import 'package:flutter/material.dart';
import 'package:frontend/components/modals/modal_classify.dart';
import 'package:frontend/components/modals/modal_filter.dart';

class CategoryProvider extends ChangeNotifier {
  SortType sortType;
  ViewType viewType;
  bool classify;
  CategoryProvider(
      {this.sortType = SortType.expiryDate,
      this.viewType = ViewType.grid,
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
}
