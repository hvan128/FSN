import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/services/api_service.dart';

class UserService {
  static Future<void> updateUser({required Map<String, dynamic> user}) async {
    ApiService.put('${Config.USER_API}}', user);
  }

  static Future<UserModel?> getUserById({required int id}) async {
    UserModel? user;
    await ApiService.get('${Config.USER_API}/$id').then((value) {
      user = UserModel.fromJson(jsonDecode(value)[0]);
    });
    return user;
  }
}