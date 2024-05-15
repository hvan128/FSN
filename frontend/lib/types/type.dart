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
  String? type;
  int? quantity;
  bool? isSelected;
  Reaction({
    this.type,
    this.quantity,
    this.isSelected = false,
  });
}

class ModalPosition {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const ModalPosition({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  const ModalPosition.fromLTRB({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  const ModalPosition.symmetric({
    required double horizontal,
    required double vertical,
  })  : left = horizontal,
        right = horizontal,
        top = vertical,
        bottom = vertical;

  const ModalPosition.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  });
}


enum Sort {
  asc,
  desc,
}