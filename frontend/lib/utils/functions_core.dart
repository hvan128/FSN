import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/loading.dart';
import 'package:intl/intl.dart';

class FunctionCore {
  static String convertToSlug(String text) {
    text = text.replaceAll(RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'), 'a');
    text = text.replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), 'e');
    text = text.replaceAll(RegExp(r'[ìíịỉĩ]'), 'i');
    text = text.replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), 'o');
    text = text.replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), 'u');
    text = text.replaceAll(RegExp(r'[ỳýỵỷỹ]'), 'y');
    text = text.replaceAll(RegExp(r'[đ]'), 'd');

    return text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9-]+'), '-');
  }

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8.0),
        animation: CurvedAnimation(
            parent: AnimationController(
              duration: const Duration(milliseconds: 500),
              // ignore: use_build_context_synchronously
              vsync: Scaffold.of(context),
            ),
            curve: Curves.easeInOut),
      ),
    );
  }

  static List<Item> getUnitList(String? type) {
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
    return foods
        .firstWhere((element) => false,
            orElse: () =>
                ItemFood(categories: [], value: '', label: 'Khác', icon: ''))
        .label;
  }

  static List<ItemFood> getFoodList(List<Category> categories) {
    List<Category> fruits = [];
    List<Category> meats = [];
    List<Category> vegetables = [];
    List<Category> dairyProducts = [];
    List<Category> dishes = [];
    List<Category> seafood = [];
    List<Category> drinks = [];
    List<Category> alcohol = [];
    List<Category> spices = [];
    List<Category> bread = [];
    List<Category> sauces = [];
    List<Category> desserts = [];
    List<Category> nuts = [];
    List<Category> cereals = [];
    List<Category> etc = [];
    for (Category category in categories) {
      switch (category.type) {
        case 'fruits':
          fruits.add(category);
        case 'meats':
          meats.add(category);
        case 'vegetables':
          vegetables.add(category);
        case 'dairyProducts':
          dairyProducts.add(category);
        case 'dishes':
          dishes.add(category);
        case 'seafood':
          seafood.add(category);
        case 'drinks':
          drinks.add(category);
        case 'alcohol':
          alcohol.add(category);
        case 'sauces':
          spices.add(category);
        case 'bread':
          bread.add(category);
        case 'sauces':
          sauces.add(category);
        case 'desserts':
          desserts.add(category);
        case 'nuts':
          nuts.add(category);
        case 'cereals':
          cereals.add(category);
        default:
          etc.add(category);
      }
    }
    List<ItemFood> foods = [
      ItemFood(
        categories: fruits,
        value: 'fruits',
        label: 'Trái cây',
        icon: 'assets/icons/fruits/fruits.png',
      ),
      ItemFood(
        categories: meats,
        value: 'meats',
        label: 'Thịt',
        icon: 'assets/icons/meats/meats.png',
      ),
      ItemFood(
        categories: vegetables,
        value: 'vegetables',
        label: 'Rau',
        icon: 'assets/icons/vegetables/vegetables.png',
      ),
      ItemFood(
        categories: dairyProducts,
        value: 'dairy_products',
        label: 'Sản phẩm từ sữa',
        icon: 'assets/icons/dairy_products/dairy_products.png',
      ),
      ItemFood(
        categories: dishes,
        value: 'dishes',
        label: 'Món ăn',
        icon: 'assets/icons/dishes/dishes.png',
      ),
      ItemFood(
        categories: seafood,
        value: 'seafood',
        label: 'Hải sản',
        icon: 'assets/icons/seafood/seafood.png',
      ),
      ItemFood(
        categories: drinks,
        value: 'drinks',
        label: 'Đồ uống',
        icon: 'assets/icons/drinks/drinks.png',
      ),
      ItemFood(
        categories: alcohol,
        value: 'alcohol',
        label: 'Rượu',
        icon: 'assets/icons/alcohol/alcohol.png',
      ),
      ItemFood(
        categories: sauces,
        value: 'sauces',
        label: 'Nước xốt',
        icon: 'assets/icons/sauces/sauces.png',
      ),
      ItemFood(
        categories: spices,
        value: 'spices',
        label: 'Gia vị',
        icon: 'assets/icons/spices/spices.png',
      ),
      ItemFood(
        categories: bread,
        value: 'bread',
        label: 'Bánh mì',
        icon: 'assets/icons/bread/bread.png',
      ),
      ItemFood(
        categories: desserts,
        value: 'desserts',
        label: 'Tráng miệng',
        icon: 'assets/icons/desserts/desserts.png',
      ),
      ItemFood(
        categories: nuts,
        value: 'nuts',
        label: 'Quả hạch',
        icon: 'assets/icons/nuts/nuts.png',
      ),
      ItemFood(
        categories: cereals,
        value: 'cereals',
        label: 'Ngũ cốc',
        icon: 'assets/icons/cereals/cereals.png',
      ),
      ItemFood(
        categories: etc,
        value: 'etc',
        label: 'Vân vân.',
        icon: 'assets/icons/etc/etc.png',
      ),
    ];
    return foods;
  }

  Map<String, dynamic> parseInput(String input) {
    String unit = '';
    String quantity = '';
    // Tạo mẫu để tìm kiếm số lượng và đơn vị
    RegExp quantityRegExp = RegExp(
        r'(\d+\.?\d*|nửa|bán|hai|ba|bốn|một|sáu|bảy|tám|chín)\s*'); // Mẫu cho số lượng

    // Tìm kiếm số lượng và đơn vị trong chuỗi nhập vào
    String rawQuantity = quantityRegExp.firstMatch(input)?.group(1) ?? '';
    quantity = convertToNumeric(rawQuantity);
    unit = input.replaceAll(rawQuantity, '').trim();
    return {'unit': unit, 'quantity': quantity};
  }

  String convertToNumeric(String quantity) {
    // Chuyển đổi các số lượng từ ngôn ngữ tự nhiên sang số
    switch (quantity) {
      case 'nửa':
        return '1/2';
      case 'bán':
        return '1/2';
      case 'hai':
        return '2';
      case 'ba':
        return '3';
      case 'bốn':
        return '4';
      case 'một':
        return '1';
      case 'sáu':
        return '6';
      case 'bảy':
        return '7';
      case 'tám':
        return '8';
      case 'chín':
        return '9';
      default:
        return quantity;
    }
  }

  static String convertImageUrl(String url) {
    return 'http://${Config.API_URL}/uploads/$url';
  }

  static DateTime convertTime(String time) {
    DateTime date = !time.endsWith('Z')
        ? DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parseUTC(time).toLocal()
        : DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").parseUtc(time).toLocal();

    return date;
  }

  static String formatDate(DateTime date) {
    return 'Vào lúc ${date.hour}:${date.minute} ngày ${date.day} tháng ${date.month} năm ${date.year}';
  }

  static String calculateDuration(DateTime date) {
    DateTime now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inDays > 0) {
      if (difference.inDays > 30) {
        return '${date.minute}: ${date.hour} ngày ${date.day}/${date.month}/${date.year}';
      } else {
        return '${difference.inDays} ngày trước';
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} phút trước';
    } else {
      return '${difference.inSeconds} giây trước';
    }
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
