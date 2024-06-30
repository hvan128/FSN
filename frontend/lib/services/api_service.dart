import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/google_sign_in.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<dynamic> get(String apiUrl,
      {Map<String, dynamic>? queryParams}) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Google ${loginDetails!.data!.token}'
      };
      var url = Uri.http(Config.API_URL, apiUrl, queryParams);
      var response = await client.get(url, headers: requestHeaders);
      if (response.statusCode == 401) {
        GoogleSignInProvider().refreshToken();
      }
      return response.body;
    } catch (e) {
      showDialog(
          context: Navigate().navigationKey.currentContext!,
          builder: (context) {
            return const MyAlert(
              alertType: AlertType.error,
              position: AlertPosition.topCenter,
              title: 'Lỗi',
              description: 'Hệ thống đang bận vui lòng thử lại sau!',
            );
          });
    }
  }

  static Future<dynamic> post(String apiUrl, Map<String, dynamic> model) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Google ${loginDetails!.data!.token}'
      };
      var url = Uri.http(Config.API_URL, apiUrl);
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model),
      );
      if (response.statusCode == 401) {
        GoogleSignInProvider().refreshToken();
      }
      return response.body;
    } catch (e) {
      showDialog(
          context: Navigate().navigationKey.currentContext!,
          builder: (context) {
            return const MyAlert(
              alertType: AlertType.error,
              position: AlertPosition.topCenter,
              title: 'Lỗi',
              description: 'Hệ thống đang bận vui lòng thử lại sau!',
            );
          });
    }
  }

  static Future<dynamic> put(String apiUrl, Map<String, dynamic> model) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Google ${loginDetails!.data!.token}'
      };
      var url = Uri.http(Config.API_URL, apiUrl);
      var response = await client.put(
        url,
        headers: requestHeaders,
        body: jsonEncode(model),
      );
      if (response.statusCode == 401) {
        GoogleSignInProvider().refreshToken();
      }
      return response.body;
    } catch (e) {
      showDialog(
          context: Navigate().navigationKey.currentContext!,
          builder: (context) {
            return const MyAlert(
              alertType: AlertType.error,
              position: AlertPosition.topCenter,
              title: 'Lỗi',
              description: 'Hệ thống đang bận vui lòng thử lại sau!',
            );
          });
    }
  }

  static Future<bool> delete(String apiUrl,
      {Map<String, dynamic>? queryParams}) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Google ${loginDetails!.data!.token}'
      };
      var url = Uri.http(Config.API_URL, apiUrl, queryParams);
      var response = await client.delete(
        url,
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      showDialog(
          context: Navigate().navigationKey.currentContext!,
          builder: (context) {
            return const MyAlert(
              alertType: AlertType.error,
              position: AlertPosition.topCenter,
              title: 'Lỗi',
              description: 'Hệ thống đang bận vui lòng thử lại sau!',
            );
          });
      return false;
    }
  }
}
