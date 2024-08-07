import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:provider/provider.dart';
import '../../models/community/dish.dart';
import 'package:http/http.dart' as http;

class DishService {
  static Future<bool> addDish(Dish dish) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Google ${loginDetails!.data!.token}'
    };
    var url = Uri.http(Config.API_URL, Config.DISH_API);
    var request = http.MultipartRequest("POST", url);
    final ingredients = dish.ingredients!.map((e) => e.toJson()).toList();
    final steps = dish.steps!.map((e) => e.toJson()).toList();
    request.headers.addAll(requestHeaders);
    request.fields['label'] = dish.label!;
    request.fields['description'] = dish.description!;
    request.fields['rangeOfPeople'] = dish.rangeOfPeople!;
    request.fields['cookingTime'] = dish.cookingTime!;
    request.fields['ownerId'] = dish.owner!.id!.toString();
    request.fields['ingredients'] = jsonEncode(ingredients);
    request.fields['steps'] = jsonEncode(steps);
    request.fields['type'] = dish.type!;
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'image',
      dish.image!,
    );
    request.files.add(multipartFile);
    dish.steps?.forEach((element) async {
      if (element.image != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'step_no_${element.no}',
          element.image!,
        ));
      }
    });
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateDish(Dish dish, List<String> fileSelected) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Google ${loginDetails!.data!.token}'
    };
    var url = Uri.http(Config.API_URL, '${Config.DISH_API}/${dish.id}');
    var request = http.MultipartRequest("PUT", url);
    final ingredients = dish.ingredients!.map((e) => e.toJson()).toList();
    final steps = dish.steps!.map((e) => e.toJson()).toList();
    request.headers.addAll(requestHeaders);
    request.fields['fileSelected'] = jsonEncode(fileSelected);
    request.fields['label'] = dish.label!;
    request.fields['ownerId'] = dish.owner!.id!.toString();
    request.fields['description'] = dish.description!;
    request.fields['rangeOfPeople'] = dish.rangeOfPeople!;
    request.fields['cookingTime'] = dish.cookingTime!;
    request.fields['type'] = dish.type!;
    request.fields['ingredients'] = jsonEncode(ingredients);
    request.fields['steps'] = jsonEncode(steps);
    request.fields['id'] = dish.id!.toString();
    request.fields['status'] = dish.status!;
    if (fileSelected.contains('image')) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image',
        dish.image!,
      );
      request.files.add(multipartFile);
    } else {
      request.fields['image'] = dish.image ?? '';
    }
    dish.steps?.forEach((element) async {
      if (element.image != null &&
          fileSelected.contains('step_no_${element.no}')) {
        request.files.add(await http.MultipartFile.fromPath(
          'step_no_${element.no}',
          element.image!,
        ));
      } else {
        request.fields['step_no_${element.no}'] = element.image ?? '';
      }
    });
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Dish>> getAllDish(
      int page, int pageSize, String type) async {
    List<Dish> dishes = [];
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
      'type': type,
      'status': 'approved',
    };
    await ApiService.get(Config.DISH_API, queryParams: queryParams)
        .then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        dishes = dishFromJson(data);
      }
    });
    return dishes;
  }

  static Future<List<Dish>> getDishByIngredient(
      String? ingredient1, String? ingredient2, int page, int pageSize) async {
    List<Dish> dishes = [];
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };
    await ApiService.post('${Config.DISH_API}/ingredient', {
      'ingredient1': ingredient1,
      'ingredient2': ingredient2,
      ...queryParams
    }).then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        dishes = dishFromJson(data);
      }
    });
    return dishes.where((dish) => dish.status == 'APPROVED').toList();
  }

  static Future<Map<String, dynamic>> getDishByKeyword(
      {required String keyword,
      required int page,
      required int pageSize,
      String? type}) async {
    List<Dish> dishes = [];
    int total = 0;
    var params = type != null
        ? {'keyword': keyword, 'page': page, 'pageSize': pageSize, 'type': type}
        : {
            'keyword': keyword,
            'page': page,
            'pageSize': pageSize,
          };

    await ApiService.post('${Config.DISH_API}/keyword', params).then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        total = jsonDecode(value.toString())['total'];
        dishes = dishFromJson(data);
      }
    });
    return {
      'dishes': dishes.where((dish) => dish.status == 'APPROVED').toList(),
      'total': total,
    };
  }

  static Future<Map<String, dynamic>> getDishByOwnerId(
      int? ownerId, int page, int pageSize, String? type,
      [String? status]) async {
    List<Dish> dishes = [];
    int total = 0;
    final queryParams = status != null
        ? {
            'page': page.toString(),
            'pageSize': pageSize.toString(),
            'type': type,
            'status': status
          }
        : {
            'page': page.toString(),
            'pageSize': pageSize.toString(),
            'type': type
          };
    await ApiService.get('${Config.DISH_API}/owner/$ownerId',
            queryParams: queryParams)
        .then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        total = jsonDecode(value.toString())['totalItems'];
        dishes = dishFromJson(data);
      }
    });
    return {
      'dishes': dishes,
      'total': total,
    };
  }

  static Future<Map<String, dynamic>> getSavedDish(
      int userId, int page, int pageSize, String? type) async {
    List<Dish> dishes = [];
    int total = 0;
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
      'type': type
    };
    await ApiService.get('${Config.DISH_API}/saved/$userId',
            queryParams: queryParams)
        .then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        total = jsonDecode(value.toString())['total'];
        dishes = dishFromJson(data);
      }
    });
    return {
      'dishes': dishes,
      'total': total,
    };
  }

  static Future<Dish> getDishById({required int id}) async {
    return await ApiService.get('${Config.DISH_API}/$id').then((value) {
      if (value != null) {
        return Dish.fromJson(jsonDecode(value));
      } else {
        return Dish();
      }
    });
  }

  static Future<void> deleteDish(int id) async {
    await ApiService.delete('${Config.DISH_API}/$id');
  }

  static Future<void> addFeel(Feel feel, [UserModel? owner]) async {
    var model = {
      'type': feel.type,
      'userId': feel.userId,
      'dishId': feel.dishId,
      'feedbackId': feel.feedbackId
    };
    var user = Provider.of<UserProvider>(
            Navigate().navigationKey.currentContext!,
            listen: false)
        .user;
    if (user?.id != owner?.id) {
      await ApiService.post('${Config.DISH_API}/feel', model);
      if (owner != null && owner.fcmToken != null) {
        await ApiService.post(Config.SEND_NOTIFICATION_API, {
          'receiverToken': owner.fcmToken,
          'title': 'Thông báo',
          'body':
              '${user?.displayName} đã bày tỏ cảm xúc vào bài viết của bạn!',
          'data': {
            'type': 'community',
          }
        });
      }
    }
  }

  static Future<void> deleteFeel(Feel feel, String feelTo) async {
    final queryParams = {
      'type': feel.type,
      'userId': feel.userId.toString(),
      'dishId': feel.dishId.toString(),
      'feedbackId': feel.feedbackId.toString()
    };
    if (feelTo == 'dish') {
      await ApiService.delete('${Config.DISH_API}/feel',
          queryParams: queryParams);
    } else if (feelTo == 'feedback') {
      await ApiService.delete('${Config.DISH_API}/feedback/feel',
          queryParams: queryParams);
    }
  }

  static Future<void> saveDish(Saved saved) async {
    var model = {
      'userId': saved.userId,
      'dishId': saved.dishId,
    };
    await ApiService.post('${Config.DISH_API}/save', model);
  }

  static Future<void> unSavedDish(Saved saved) async {
    var model = {
      'userId': saved.userId,
      'dishId': saved.dishId,
    };
    await ApiService.post('${Config.DISH_API}/unsaved', model);
  }

  static Future<bool> createFeedback(FeedbackModel feedback) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Google ${loginDetails!.data!.token}'
    };
    var url = Uri.http(Config.API_URL, '${Config.DISH_API}/feedback');
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(requestHeaders);
    request.fields['dishId'] = feedback.dishId.toString();
    request.fields['content'] = feedback.content!;
    request.fields['rating'] = feedback.rating.toString();
    request.fields['userId'] = feedback.userId.toString();
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'image',
      feedback.image!,
    );
    request.files.add(multipartFile);
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Map<String, dynamic>> getFeedbackByDishId(
      int dishId, int page, int pageSize) async {
    List<FeedbackModel> feedbacks = [];
    int total = 0;
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };
    await ApiService.get('${Config.DISH_API}/feedback/$dishId',
            queryParams: queryParams)
        .then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        total = jsonDecode(value.toString())['total'];
        feedbacks = feedbacksFromJson(data);
      }
    });
    return {
      'feedbacks': feedbacks,
      'total': total,
    };
  }

  static Future<List<FeedbackModel>> getAllFeedback(
      int page, int pageSize) async {
    List<FeedbackModel> feedbacks = [];
    await ApiService.get('${Config.COMMUNITY_API}/feedback', queryParams: {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    }).then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        feedbacks = feedbacksFromJson(data);
      }
    });
    return feedbacks;
  }

  static Future<List<FeedbackModel>> getFeedbackByUserId(
      int userId, int page, int pageSize) async {
    List<FeedbackModel> feedbacks = [];
    await ApiService.get('${Config.COMMUNITY_API}/feedback/user/$userId',
        queryParams: {
          'page': page.toString(),
          'pageSize': pageSize.toString()
        }).then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        feedbacks = feedbacksFromJson(data);
      }
    });
    return feedbacks;
  }
}
