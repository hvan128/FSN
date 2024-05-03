import 'package:frontend/utils/functions_core.dart';

List<Dish> dishFromJson(dynamic str) =>
    List<Dish>.from((str).map((x) => Dish.fromJson(x)));

class Dish {
  int? ownerId;
  String? label;
  String? image;
  String? description;
  List<StepModel>? steps;
  List<Ingredient>? ingredients;
  String? rangOfPeople;
  bool? isSaved;
  String? cookingTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  Dish({
    this.ownerId,
    this.label,
    this.image,
    this.description,
    this.ingredients,
    this.steps,
    this.rangOfPeople,
    this.isSaved = false,
    this.cookingTime,
    this.createdAt,
    this.updatedAt,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
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
      rangOfPeople: json['rangOfPeople'],
      isSaved: json['isSaved'],
      cookingTime: json['cookingTime'],
      createdAt:
          json['createdAt'] != null ? FunctionCore.convertTime(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? FunctionCore.convertTime(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerId': ownerId,
      'label': label,
      'image': image,
      'description': description,
      'ingredients': ingredients?.map((e) => e.toJson()).toList(),
      'steps': steps?.map((e) => e.toJson()).toList(),
      'rangOfPeople': rangOfPeople,
      'isSaved': isSaved,
      'cookingTime': cookingTime,
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
