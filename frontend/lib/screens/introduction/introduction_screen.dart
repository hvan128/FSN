import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/services/auth/google__signin_api.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/text.dart';

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
                          MyButton(
                              text: 'Đăng nhập bằng Google',
                              buttonType: ButtonType.primary,
                              onPressed: () {
                                GoogleSignInApi.login();
                              },
                              startIcon: Image.asset(
                                  'assets/icons/i16/google.png',
                                  width: 24,
                                  height: 24)),
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
}
