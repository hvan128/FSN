import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/auth/login_response_model.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    String token = googleAuth.idToken!;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    return {'user': user, 'token': token};
  }

  Future refreshToken() async {
    // var loginDetails = await SharedService.loginDetails();
    // String token = loginDetails!.data!.token;
    // print('token');
    // for (int i = 0; i < token.length; i += 500) {
    //   print(token.substring(i, min(i + 500, token.length)));
    // }
    // final url = Uri.parse(
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithIdp?key=${Config.API_KEY}');
    // const provider = 'google.com';

    // final response = await http.post(url,
    //     headers: {'Content-type': 'application/json'},
    //     body: jsonEncode({
    //       'postBody': 'id_token=$token&providerId=$provider',
    //       'requestUri': 'http://localhost',
    //       'returnIdpCredential': true,
    //       'returnSecureToken': true
    //     }));
    // print('response');
    // print(response.body);
    // if (response.statusCode != 200) {
    //   throw 'Refresh token request failed: ${response.statusCode}';
    // }

    // final data = Map<String, dynamic>.of(jsonDecode(response.body));
    // if (data.containsKey('refreshToken')) {
    //   final String refreshToken = data['refreshToken'];
    //   print('refreshToken');
    //   for (int i = 0; i < refreshToken.length; i += 500) {
    //     print(refreshToken.substring(
    //         i, min(i + 500, refreshToken.length)));
    //   }
      // Map<String, dynamic> loginResponse = {
      //   'message': 'Login successfully',
      //   'data': {
      //     'token': refreshToken,
      //     'username': loginDetails.data!.username,
      //     'email': loginDetails.data!.email,
      //     'id': loginDetails.data!.id,
      //   }
      // };
      // await SharedService.setLoginDetails(
      //     loginResponseJson(jsonEncode(loginResponse)));
    // } else {
    //   throw 'No refresh token in response';
    // }
    final user = await googleSignIn.signInSilently();
    if (user == null) return;
    _user = user;
    final googleAuth = await user.authentication;
    String token = googleAuth.idToken!;
    print('token: $token');
    final currentUser = await SharedService.loginDetails();
    Map<String, dynamic>  loginResponse = {
          'message': 'Login successfully',
          'data': {
            'token': token,
            'username': currentUser!.data!.username,
            'email': currentUser.data!.email,
            'id': currentUser.data!.id,
          }
        };
        await SharedService.setLoginDetails(loginResponseJson(jsonEncode(loginResponse)));
        notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future isLoggedIn() async {
    return await googleSignIn.isSignedIn();
  }
}
