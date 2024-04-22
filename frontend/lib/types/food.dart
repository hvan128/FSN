class ItemFood {
  final String label;
  final String value;
  final String icon;
  final List<ItemCategory> categories;

  ItemFood({
    required this.categories,
    required this.value,
    required this.label,
    required this.icon,
  });

}

class ItemCategory {
  final String label;
  final String value;
  final String icon;
  final String type;
  final int defaultDuration;

  ItemCategory(
      {required this.label,
      required this.value,
      required this.icon,
      required this.type,
      required this.defaultDuration});
}
