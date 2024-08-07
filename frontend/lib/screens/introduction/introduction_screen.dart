// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/auth/login_response_model.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/auth.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/provider/google_sign_in.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: MyColors.grey['c50']!,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/i16/logo.png',
                              width: 150, height: 150),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyText(
                        text: '${Config.APP_NAME} - ${Config.APP_SLOGAN}',
                        fontSize: FontSize.z20,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        shadow: Shadow(
                          color: MyColors.primary['CulturalYellow']!['c700']!
                              .withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                        ),
                        color: MyColors.primary['CulturalYellow']!['c700']!),
                    const SizedBox(height: 20),
                    MyText(
                        text: 'Tủ lạnh cá nhân',
                        fontSize: FontSize.z20,
                        fontWeight: FontWeight.w800,
                        color: MyColors.grey['c700']!),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: MyColors.grey['c100']!,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.grey['c500']!.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 5),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              text:
                                  'Quản lý tủ lạnh của bạn một cách dễ dàng mà không cần đăng nhập',
                              fontSize: FontSize.z15,
                              fontWeight: FontWeight.w700,
                              color: MyColors.grey['c700']!),
                          const SizedBox(height: 10),
                          MyText(
                              text:
                                  ' - Lựa chọn tốt nhất cho việc quản lý thực phẩm cá nhân',
                              fontSize: FontSize.z15,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey['c700']!),
                          const SizedBox(height: 10),
                          MyText(
                              text: ' - Sử dụng ít dữ liệu mạng nhất',
                              fontSize: FontSize.z15,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey['c700']!),
                          const SizedBox(height: 20),
                          MyButton(
                            text: 'Bắt đầu',
                            onPressed: () {},
                            buttonType: ButtonType.primary,
                            endIcon: Image.asset(
                                'assets/icons/i16/arrow-left.png',
                                width: 24,
                                height: 24,
                                color: MyColors.grey['c900']!),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyText(
                        text: 'Tủ lạnh gia đình',
                        fontSize: FontSize.z20,
                        fontWeight: FontWeight.w800,
                        color: MyColors.grey['c700']!),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: MyColors.grey['c100']!,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.grey['c500']!.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 5),
                            )
                          ]),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              text:
                                  'Lưu trữ dữ liệu để quản lý tủ lạnh cùng người thân',
                              fontSize: FontSize.z15,
                              fontWeight: FontWeight.w700,
                              color: MyColors.grey['c700']!),
                          const SizedBox(height: 10),
                          MyText(
                              text: ' - Tùy chọn yêu cầu đăng nhập',
                              fontSize: FontSize.z15,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey['c700']!),
                          const SizedBox(height: 10),
                          MyText(
                              text:
                                  ' - Tính năng cộng đồng cho phép chia sẻ công thức nấu ăn với mọi người',
                              fontSize: FontSize.z15,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey['c700']!),
                          const SizedBox(height: 20),
                          StreamBuilder(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                } else if (snapshot.hasData) {
                                  print(snapshot.data);
                                  return MyButton(
                                      text: 'Thử lại',
                                      buttonType: ButtonType.primary,
                                      onPressed: () {
                                        onPressTry(context);
                                      },
                                      startIcon: Image.asset(
                                          'assets/icons/i16/google.png',
                                          width: 24,
                                          height: 24));
                                } else {
                                  return MyButton(
                                      text: 'Đăng nhập bằng Google',
                                      buttonType: ButtonType.primary,
                                      onPressed: () {
                                        onPressLoginGoogle(context);
                                      },
                                      startIcon: Image.asset(
                                          'assets/icons/i16/google.png',
                                          width: 24,
                                          height: 24));
                                }
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future onPressLoginGoogle(BuildContext context) async {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    try {
      Map<String, dynamic> response = await provider.googleLogin();
      UserCredential user = response['user'];
      String token = response['token'];
      if (user.additionalUserInfo!.isNewUser) {
        Navigator.pushReplacementNamed(
          context,
          RouterAuth.createId,
          arguments: {
            'user': UserModel(
              displayName: user.additionalUserInfo!.profile!['name'],
              email: user.additionalUserInfo!.profile!['email'],
              imageUrl: user.additionalUserInfo!.profile!['picture'],
              token: token,
              role: 'user',
            )
          },
        );
      } else {
        var client = http.Client();
        Map<String, String> requestHeaders = {
          'Content-Type': 'application/json',
          'Authorization': token
        };
        Map<String, dynamic> body = {
          'email': user.additionalUserInfo!.profile!['email']
        };
        var url = Uri.http(Config.API_URL, '${Config.USER_API}/email');
        var response = await client.post(url,
            headers: requestHeaders, body: jsonEncode(body));
        UserModel currentUser =
            UserModel.fromJson(jsonDecode(response.body)[0]);

        context.read<UserProvider>().setUser(user: currentUser);
        Map<String, dynamic> loginResponse = {
          'message': 'Login successfully',
          'data': {
            'token': token,
            'username': currentUser.displayName,
            'email': currentUser.email,
            'id': currentUser.id,
          }
        };
        await SharedService.setLoginDetails(
            loginResponseJson(jsonEncode(loginResponse)));
        FirebaseMessaging.instance.getToken().then((value) {
          currentUser.fcmToken = value;
          print(currentUser.fcmToken);
          ApiService.put(Config.USER_API, currentUser.toJson());
        });
        Navigator.pushReplacementNamed(context, RouterIntroduction.afterLogin);
      }
    } catch (e) {
      print(e);
    }
  }

  void onPressTry(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.logout();
    SharedService.logout();
  }
}
