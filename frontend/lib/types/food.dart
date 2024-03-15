class Food {
  final String label;
  final String value;
  final String icon;
  final List<Category> categories;

  Food(this.categories, this.value, this.label, this.icon);
}

class Category {
  final String label;
  final String value;
  final String icon;
  final String type;
  final double duration;

  Category(this.value, this.duration, this.label, this.icon, this.type);
}
