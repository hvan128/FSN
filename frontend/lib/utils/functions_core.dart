import 'package:flutter/material.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/loading.dart';

class FunctionCore {
  static List<Item> getUnitList(String type) {
    switch (type) {
      case 'fruits':
        return [
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'qua',
            label: 'quả',
          ),
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'piece',
            label: 'cái',
          )
        ];

      case 'meats':
        return [
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'piece',
            label: 'cái',
          ),
          Item(
            value: 'con',
            label: 'con',
          )
        ];

      case 'vegetables':
        return [
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'piece',
            label: 'cái',
          ),
          Item(
            value: 'bundle',
            label: 'bó',
          )
        ];

      case 'drinks':
        return [
          Item(
            value: 'litre',
            label: 'lít',
          ),
          Item(
            value: 'ml',
            label: 'ml',
          ),
          Item(
            value: 'bottle',
            label: 'chai',
          ),
          Item(
            value: 'can',
            label: 'lon',
          )
        ];

      case 'dairy_products':
        return [
          Item(
            value: 'litre',
            label: 'lít',
          ),
          Item(
            value: 'ml',
            label: 'ml',
          ),
          Item(
            value: 'piece',
            label: 'cái',
          ),
          Item(
            value: 'packet',
            label: 'gói',
          )
        ];

      case 'dishes':
        return [
          Item(
            value: 'plate',
            label: 'đĩa',
          ),
          Item(
            value: 'bowl',
            label: 'tô',
          ),
          Item(
            value: 'set',
            label: 'bộ',
          )
        ];

      case 'seafood':
        return [
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'piece',
            label: 'con',
          )
        ];

      case 'alcohol':
        return [
          Item(
            value: 'litre',
            label: 'lít',
          ),
          Item(
            value: 'ml',
            label: 'ml',
          ),
          Item(
            value: 'bottle',
            label: 'chai',
          )
        ];

      case 'sauces':
        return [
          Item(
            value: 'ml',
            label: 'ml',
          ),
          Item(
            value: 'bottle',
            label: 'chai',
          ),
          Item(
            value: 'jar',
            label: 'hũ',
          )
        ];

      case 'spices':
        return [
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'jar',
            label: 'hũ',
          )
        ];

      case 'bread':
        return [
          Item(
            value: 'piece',
            label: 'ổ',
          ),
          Item(
            value: 'loaf',
            label: 'bánh mỳ',
          ),
          Item(
            value: 'packet',
            label: 'gói',
          )
        ];

      case 'desserts':
        return [
          Item(
            value: 'piece',
            label: 'cái',
          ),
          Item(
            value: 'scoop',
            label: 'muỗng',
          ),
          Item(
            value: 'serving',
            label: 'phần',
          )
        ];

      case 'nuts':
        return [
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'packet',
            label: 'gói',
          )
        ];

      case 'cereals':
        return [
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'gram',
            label: 'gram',
          ),
          Item(
            value: 'packet',
            label: 'gói',
          )
        ];

      default:
        return [
          Item(
            value: 'piece',
            label: 'cái',
          ),
          Item(
            value: 'kg',
            label: 'kg',
          ),
          Item(
            value: 'lit',
            label: 'lít',
          )
        ];
    }
  }

  static String getCategoryType(String type) {
    return foods.firstWhere((element) => false, orElse: () => ItemFood(categories: [], value: '', label: 'Khác', icon: '')).label;
  }


}
  class Loading {
  static void showLoading() {
    showDialog(
        context: Navigate().navigationKey.currentContext!,
        builder: (BuildContext context) {
          return const MyLoading();
        });
  }

  static void hideLoading() {
    Navigate.pop();
  }
}
