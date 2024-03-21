class Food {
  final String label;
  final String value;
  final String icon;
  final List<Category> categories;

  Food({
    required this.categories,
    required this.value,
    required this.label,
    required this.icon,
  });

}

class Category {
  final String label;
  final String value;
  final String icon;
  final String type;
  final double defaultDuration;

  Category(
      {required this.label,
      required this.value,
      required this.icon,
      required this.type,
      required this.defaultDuration});
}
