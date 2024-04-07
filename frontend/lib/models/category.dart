class Category {
  final int id;
  final String label;
  final String value;
  final String icon;
  final String type;
  final DateTime manufactureDate;
  final DateTime expiryDate;
  final int positionId;
  final int subPositionId;
  final int quantity;
  final String unit;

  Category({
    this.id = 0,
    required this.manufactureDate,
    required this.expiryDate,
    required this.positionId,
    required this.subPositionId,
    required this.quantity,
    required this.unit,
    required this.label,
    required this.icon,
    required this.value,
    required this.type,
  });
}


