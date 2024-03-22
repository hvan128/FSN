class Item {
  final String value;
  final String label;
  final String? icon;

  Item({
    required this.value,
    required this.label,
    this.icon,
  });
}

class Reaction {
  final String type;
  final String quantity;
  final bool? isSelected;
  Reaction({
    required this.type,
    required this.quantity,
    this.isSelected = false,
  });
}