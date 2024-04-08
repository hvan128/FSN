class CategoryResponseModel {
  String? message;
  List<Category>? data;

  CategoryResponseModel({this.message, this.data});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
      this.manufactureDate,
      this.expiryDate});

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
    manufactureDate = json['manufactureDate'];
    expiryDate = json['expiryDate'];
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
    return data;
  }
}