import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/auth/login_request_model.dart';
import 'package:frontend/screens/auth/register_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/services/auth/auth_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: ProgressHUD(
            inAsyncCall: isApiCallProcess,
            opacity: 0.3,
            key: UniqueKey(),
            child: Form(
              key: globalFormKey,
              child: _loginUI(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 32),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      FormHelper.inputFieldWidget(
                        context,
                        "Username",
                        "Username",
                        (onValidateVal) {
                          if (onValidateVal.isEmpty) {
                            return 'Username can\'t be empty.';
                          }

                          return null;
                        },
                        (onSavedVal) => {
                          userName = onSavedVal,
                        },
                        initialValue: "",
                        obscureText: false,
                        borderFocusColor:
                            MyColors.primary['CulturalYellow']!['c700']!,
                        prefixIconColor:
                            MyColors.primary['CulturalYellow']!['c700']!,
                        borderColor:
                            MyColors.primary['CulturalYellow']!['c800']!,
                        textColor: MyColors.primary['CulturalYellow']!['c800']!,
                        hintColor: MyColors.primary['CulturalYellow']!['c800']!
                            .withOpacity(0.7),
                        borderRadius: 10,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: FormHelper.submitButton(
                          "Đăng nhập",
                          () {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });

                              LoginRequestModel model = LoginRequestModel(
                                username: userName,
                                password: 'password',
                              );
                              AuthService.login(model).then(
                                (response) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  if (response.data != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  } else {
                                    FormHelper.showSimpleAlertDialog(
                                      context,
                                      Config.APP_NAME,
                                      "Invalid Username/Password !!",
                                      "OK",
                                      () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => const RegisterScreen(),
                                        ));
                                      },
                                    );
                                  }
                                },
                              );
                            }
                          },
                          btnColor:
                              MyColors.primary['CulturalYellow']!['c700']!,
                          borderColor: Colors.white,
                          txtColor: MyColors.white['c900']!,
                          borderRadius: 10,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: MyColors
                                        .primary['CulturalYellow']!['c50']!,
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
                                        color: MyColors.primary[
                                            'CulturalYellow']!['c700']!),
                                  ),
                                  const TextSpan(
                                    text: ' & ',
                                  ),
                                  TextSpan(
                                    text: 'Chính sách bảo mật',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.primary[
                                            'CulturalYellow']!['c700']!),
                                  ),
                                  const TextSpan(
                                    text: ' của chúng tôi.',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              )),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
