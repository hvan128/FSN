import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<dynamic> get(String apiUrl) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': loginDetails!.data!.token
    };
    var url = Uri.http(Config.API_URL, apiUrl);
    var response = await client.get(url, headers: requestHeaders);
    return response.body;
  }

  static Future<dynamic> post(String apiUrl, Map<String, dynamic> body) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': loginDetails!.data!.token
    };
    var url = Uri.http(Config.API_URL, apiUrl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(body),
    );
    print('response: ${response.body}');
    return response.body;
  }
}
