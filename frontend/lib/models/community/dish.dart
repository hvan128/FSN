import 'package:frontend/utils/functions_core.dart';

List<Dish> dishFromJson(dynamic str) =>
    List<Dish>.from((str).map((x) => Dish.fromJson(x)));

class Dish {
  int? id;
  int? ownerId;
  String? label;
  String? image;
  String? description;
  List<StepModel>? steps;
  List<Ingredient>? ingredients;
  String? rangeOfPeople;
  String? cookingTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Feel>? feels;
  List<Saved>? saves;

  Dish({
    this.id,
    this.ownerId,
    this.label,
    this.image,
    this.description,
    this.ingredients,
    this.steps,
    this.rangeOfPeople,
    this.cookingTime,
    this.createdAt,
    this.updatedAt,
    this.feels,
    this.saves,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      ownerId: json['ownerId'],
      label: json['label'],
      image: json['image'],
      description: json['description'],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e))
          .toList(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => StepModel.fromJson(e))
          .toList(),
      rangeOfPeople: json['rangeOfPeople'],
      cookingTime: json['cookingTime'],
      feels: (json['feels'] as List<dynamic>?)
          ?.map((e) => Feel.fromJson(e))
          .toList(),
      saves: (json['saves'] as List<dynamic>?)
          ?.map((e) => Saved.fromJson(e))
          .toList(),
      createdAt: json['createdAt'] != null
          ? FunctionCore.convertTime(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? FunctionCore.convertTime(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'label': label,
      'image': image,
      'description': description,
      'ingredients': ingredients?.map((e) => e.toJson()).toList(),
      'steps': steps?.map((e) => e.toJson()).toList(),
      'rangeOfPeople': rangeOfPeople,
      'cookingTime': cookingTime,
      'feels': feels?.map((e) => e.toJson()).toList(),
      'saves': saves?.map((e) => e.toJson()).toList(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class Saved {
  int? userId;
  int? dishId;
  DateTime? savedAt;

  Saved({
    this.userId,
    this.dishId,
    this.savedAt,
  });

  factory Saved.fromJson(Map<String, dynamic> json) {
    return Saved(
      userId: json['userId'],
      dishId: json['dishId'],
      savedAt: json['savedAt'] != null
          ? FunctionCore.convertTime(json['savedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'dishId': dishId,
      'savedAt': savedAt?.toIso8601String(),
    };
  }
}

class Feel {
  int? id;
  int? type;
  int? userId;
  int? dishId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Feel({
    this.id,
    this.type,
    this.userId,
    this.dishId,
    this.createdAt,
    this.updatedAt,
  });

  factory Feel.fromJson(Map<String, dynamic> json) {
    return Feel(
      id: json['id'],
      type: json['type'],
      userId: json['userId'],
      dishId: json['dishId'],
      createdAt: json['createdAt'] != null
          ? FunctionCore.convertTime(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? FunctionCore.convertTime(json['updatedAt'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'userId': userId,
      'dishId': dishId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

List<Ingredient> ingredientsFromJson(dynamic str) =>
    List<Ingredient>.from((str).map((x) => Ingredient.fromJson(x)));

class Ingredient {
  String? category;
  int? quantity;
  String? unit;

  Ingredient({
    this.category,
    this.quantity,
    this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      category: json['category'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'quantity': quantity,
      'unit': unit,
    };
  }
}

List<StepModel> stepsFromJson(dynamic str) =>
    List<StepModel>.from((str).map((x) => StepModel.fromJson(x)));

class StepModel {
  int? no;
  String? description;
  String? image;

  StepModel({
    this.no,
    this.description,
    this.image,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      no: json['no'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'description': description,
      'image': image,
    };
  }
}
