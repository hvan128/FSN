import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/utils/functions_core.dart';

List<Announcement> announcementFromJson(dynamic str) =>
  List<Announcement>.from((str).map((x) => Announcement.fromJson(x)));

class Announcement {
  int? id;
  String? type;
  Dish? dish;
  int? targetId;
  UserModel? user;
  Feel? feel;
  Category? category;
  bool? read;
  String? action;
  DateTime? createdAt;
  DateTime? updatedAt;

  Announcement(
      {this.id,
      this.type,
      this.targetId,
      this.dish,
      this.user,
      this.feel,
      this.category,
      this.read,
      this.action,
      this.createdAt,
      this.updatedAt,
     });

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    targetId = json['targetId'];
    dish = json['dish'] != null ? Dish.fromJson(json['dish']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    feel = json['feel'] != null ? Feel.fromJson(json['feel']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    read = json['read'] == 1 ? true : false;
    action = json['action'];

    createdAt = json['createdAt'] != null
          ? FunctionCore.convertTime(json['createdAt'])
          : null;
    updatedAt = json['updatedAt'] != null
          ? FunctionCore.convertTime(json['updatedAt'])
          : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['dishId'] = dish?.id;
    data['targetId'] = targetId;
    data['userId'] = user?.id;
    data['feelType'] = feel?.type;
    data['categoryId'] = category?.id;
    data['read'] = read;
    data['action'] = action;
    data['createdAt'] = createdAt?.toIso8601String();
    data['updatedAt'] = updatedAt?.toIso8601String();
    return data;
  }
}
