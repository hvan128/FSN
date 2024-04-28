import 'package:frontend/models/category/category.dart';

class ItemFood {
  final String label;
  final String value;
  final String icon;
  final List<Category> categories;

  ItemFood({
    required this.categories,
    required this.value,
    required this.label,
    required this.icon,
  });

}
