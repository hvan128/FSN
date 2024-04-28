List<Category> categoryFromJson(dynamic str) =>
    List<Category>.from((str).map((x) => Category.fromJson(x)));

class Category {
  int? id;
  String? icon;
  String? type;
  String? label;
  String? value;
  int? positionId;
  int? subPositionId;
  int? quantity;
  String? unit;
  DateTime? manufactureDate;
  DateTime? expiryDate;
  int? fridgeId;
  int? defaultDuration;
  int? completed;
  int? no;

  Category(
      {this.id,
      this.icon,
      this.type,
      this.label,
      this.value,
      this.positionId,
      this.subPositionId,
      this.quantity,
      this.unit,
      this.fridgeId,
      this.manufactureDate,
      this.expiryDate,
      this.defaultDuration,
      this.completed,
      this.no});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    type = json['type'];
    label = json['label'];
    value = json['value'];
    positionId = json['positionId'];
    subPositionId = json['subPositionId'];
    quantity = json['quantity'];
    unit = json['unit'];
    manufactureDate = json['manufactureDate'] == null
        ? null
        : DateTime.parse(json['manufactureDate']);
    expiryDate =
        json['expiryDate'] == null ? null : DateTime.parse(json['expiryDate']);
    defaultDuration = json['defaultDuration'];
    fridgeId = json['fridgeId'];
    completed = json['completed'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['type'] = type;
    data['label'] = label;
    data['value'] = value;
    data['positionId'] = positionId;
    data['subPositionId'] = subPositionId;
    data['quantity'] = quantity;
    data['unit'] = unit;
    data['manufactureDate'] = manufactureDate;
    data['expiryDate'] = expiryDate;
    data['defaultDuration'] = defaultDuration;
    data['completed'] = completed;
    data['fridgeId'] = fridgeId;
    data['no'] = no;
    return data;
  }
}
