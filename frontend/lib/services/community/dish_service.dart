import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/auth/shared_service.dart';
import '../../models/community/dish.dart';
import 'package:http/http.dart' as http;

class DishService {
  static Future<bool> addDish(Dish dish) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'multipart/form-data',
      'Authorization': loginDetails!.data!.token
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
    request.fields['ownerId'] = dish.ownerId!.toString();
    request.fields['ingredients'] = jsonEncode(ingredients);
    request.fields['steps'] = jsonEncode(steps);
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

  static Future<List<Dish>> getAllDish(int page, int pageSize) async {
    List<Dish> dishes = [];
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
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
      String ingredient1, String ingredient2, int page, int pageSize) async {
    List<Dish> dishes = [];
    await ApiService.post('${Config.DISH_API}/ingredient',
        {'ingredient1': ingredient1, 'ingredient2': ingredient2}).then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        dishes = dishFromJson(data);
      }
    });
    return dishes;
  }

  static Future<Map<String, dynamic>> getDishByOwnerId(
      int ownerId, int page, int pageSize) async {
    List<Dish> dishes = [];
    int total = 0;
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
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

   static Future<Map<String, dynamic>> getSavedDish(int userId, int page, int pageSize) async {
    List<Dish> dishes = [];
    int total = 0;
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };
    await ApiService.get('${Config.DISH_API}/saved/$userId', queryParams: queryParams).then((value) {
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

 

  static Future<void> addFeel(Feel feel) async {
    var model = {
      'type': feel.type,
      'userId': feel.userId,
      'dishId': feel.dishId
    };
    await ApiService.post('${Config.DISH_API}/feel', model);
  }

  static Future<void> deleteFeel(Feel feel) async {
    await ApiService.delete('${Config.DISH_API}/feel/${feel.id}');
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
}
