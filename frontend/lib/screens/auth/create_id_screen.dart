// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/auth/login_response_model.dart';
import 'package:frontend/models/auth/register_request_model.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/services/auth/auth_service.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_field.dart';

class CreateIdScreen extends StatefulWidget {
  const CreateIdScreen({super.key});

  @override
  State<CreateIdScreen> createState() => _CreateIdScreenState();
}

class _CreateIdScreenState extends State<CreateIdScreen> {
  UserModel? user;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final args = ModalRoute.of(context)!.settings.arguments as Map;
        setState(() {
          user = args['user'] as UserModel;
        });
      }
      setState(() {
        _controller.text = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey['c50']!,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    user != null && user!.displayName != null
                        ? MyText(
                            text:
                                'Xin chào ${user!.displayName}! Chỉ còn 1 bước cuối cùng!',
                            fontSize: FontSize.z22,
                            fontWeight: FontWeight.w800,
                            color: MyColors.grey['c700']!)
                        : Container(),
                    const SizedBox(height: 16),
                    MyText(
                        text: 'Hãy tạo ID ${Config.APP_NAME} của bạn',
                        fontSize: FontSize.z18,
                        fontWeight: FontWeight.w800,
                        color: MyColors.grey['c700']!),
                    const SizedBox(height: 16),
                    MyText(
                        text:
                            'ID ${Config.APP_NAME} của bạn sẽ xuất hiện trên trang bếp chính của bạn (bên cạnh tên của bạn) và sẽ giúp các bạn bếp khác tìm ra bạn dễ hơn và đề cập đến bạn trong bình luận.',
                        fontSize: FontSize.z18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c500']!),
                    const SizedBox(height: 16),
                    MyTextField(
                        prefixIcon: Icon(Icons.alternate_email),
                        obscureText: false,
                        hasError: false,
                        controller: _controller,
                        onChange: (value) => handleCheckExistUsername(value),
                        hintText: 'ID ${Config.APP_NAME}'),
                    const SizedBox(height: 16),
                    MyText(
                        text: 'ID ${Config.APP_NAME} của bạn có thể:',
                        fontSize: FontSize.z18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c500']!),
                    const SizedBox(height: 6),
                    MyText(
                        text: '- Dài từ 4 - 20 ký tự',
                        fontSize: FontSize.z18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c500']!),
                    const SizedBox(height: 6),
                    MyText(
                        text: '- Bao gồm chữ cái, chữ số, hay dấu ...',
                        fontSize: FontSize.z18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c500']!),
                    const SizedBox(height: 6),
                    MyText(
                        text: '- Không có khoảng trống nào',
                        fontSize: FontSize.z18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c500']!),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: MyButton(
                        text: 'Xác nhận ID ${Config.APP_NAME}',
                        onPressed: () {
                          onPressConfirm(context);
                        },
                        buttonType: ButtonType.primary,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  handleCheckExistUsername(String value) {
    setState(() {
      _controller.text = value;
    });
  }

  void onPressConfirm(BuildContext context) {
    RegisterRequestModel registerRequestModel = RegisterRequestModel(
      username: _controller.text,
      email: user!.email,
      imageUrl: user!.imageUrl,
      displayName: user!.displayName,
    );
    AuthService.register(registerRequestModel).then((value) async {
      if (value.data != null) {
        Map<String, dynamic>  loginResponse = {
          'message': value.message,
          'data': {
            'token': user!.token,
            'username': value.data.username,
            'email': value.data.email,
            'id': value.data.id,
          }
        };
        await SharedService.setLoginDetails(loginResponseJson(jsonEncode(loginResponse)));
        Navigator.pushNamedAndRemoveUntil(
            context, RouterIntroduction.afterLogin, (route) => false);
      } else {
        print(value.message);
      }
    });
  }
}
