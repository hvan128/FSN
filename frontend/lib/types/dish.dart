
import 'package:frontend/types/type.dart';

class Dish {
  final String ownerId;
  final String label;
  final String image;
  final String? description;
  final List<Step>? steps;
  final List<Ingredient>? ingredients;
  final int? rangOfPeople;
  final bool? isSaved;
  final double? cookingTime;
  final List<Reaction>? reactions;

  Dish({
    required this.ownerId,
    required this.label,
    required this.image,
    this.description,
    this.ingredients,
    this.steps,
    this.rangOfPeople,
    this.isSaved = false,
    this.reactions,
    this.cookingTime,
  });
}
class Ingredient {
  final String category;
  final int quantity;
  final String unit;

  Ingredient({
    required this.category,
    required this.quantity,
    required this.unit,
  });
}

class Step {
  final int no;
  final String description;
  Step({
    required this.no,
    required this.description,
  });
}