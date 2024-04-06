import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    MyText(
                        text: 'Nội trợ cùng ICook!',
                        fontSize: FontSize.z24,
                        fontWeight: FontWeight.w700,
                        color: MyColors.grey['c900']!),
                    const SizedBox(height: 15),
                    Wrap(children: [
                      MyText(
                        text: 'Đăng nhập/ Đăng ký tài khoản ',
                        fontSize: FontSize.z16,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c700']!,
                      ),
                      MyText(
                        text: 'icook',
                        fontSize: FontSize.z16,
                        fontWeight: FontWeight.w700,
                        color: MyColors.grey['c700']!,
                      ),
                      MyText(
                        text: ' ngay bây giờ',
                        fontSize: FontSize.z16,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c700']!,
                      ),
                    ]),
                    const SizedBox(height: 20),
                    MyTextField(
                      obscureText: false,
                      hasError: false,
                      hintText: 'Nhập email',
                    ),
                    const SizedBox(height: 20),
                    MyButton(text: 'Tiếp tục', onPressed: () {}),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: Stack(children: [
                        const SizedBox(
                            height: 30,
                            child: Center(
                              child: MyDivider(
                                type: Type.solid,
                              ),
                            )),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: MyColors.primary['CulturalYellow']!['c50']!,
                            child: MyText(
                                text: 'Hoặc',
                                fontSize: FontSize.z14,
                                fontWeight: FontWeight.w400,
                                color: MyColors.grey['c700']!),
                          ),
                        ))
                      ]),
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                        text: 'Đăng nhập bằng Facebook',
                        onPressed: () {},
                        buttonType: ButtonType.secondary,
                        startIcon: Image.asset(
                          'assets/icons/i16/facebook.png',
                          width: 24,
                          height: 24,
                        )),
                    const SizedBox(height: 10),
                    MyButton(
                        text: 'Đăng nhập bằng Google',
                        onPressed: () {},
                        buttonType: ButtonType.secondary,
                        startIcon: Image.asset(
                          'assets/icons/i16/google.png',
                          width: 24,
                          height: 24,
                        )),
                    const SizedBox(height: 40),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: FontSize.z14,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey['c700']!,
                          fontFamily: 'Urbanist',
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Bằng việc tiếp tục. Bạn đồng ý với ',
                          ),
                          TextSpan(
                            text: 'Điều khoản dịch vụ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors
                                    .primary['CulturalYellow']!['c700']!),
                          ),
                          const TextSpan(
                            text: ' & ',
                          ),
                          TextSpan(
                            text: 'Chính sách bảo mật',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors
                                    .primary['CulturalYellow']!['c700']!),
                          ),
                          const TextSpan(
                            text: ' của chúng tôi.',
                          ),
                        ],
                      ),
                    )
                  ]),
            )),
      ),
    );
  }
}
