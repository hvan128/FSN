import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/models/auth/login_request_model.dart';
import 'package:frontend/models/auth/login_response_model.dart';
import 'package:frontend/models/auth/register_request_model.dart';
import 'package:frontend/models/auth/register_response_model.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static var client = http.Client();  

  static Future<LoginResponseModel> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.API_URL,
      Config.LOGIN_API,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );
      return loginResponseJson(
          response.body,
        );
    } else {
      return LoginResponseModel(message: "Something went wrong", data: null);
    }
  }

  static Future<dynamic> register(
    RegisterRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.API_URL,
      Config.REGISTER_API,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(
      response.body,
    );
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': loginDetails!.data!.token
    };

    var url = Uri.http(Config.API_URL, Config.API_URL + "/users/me");

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}