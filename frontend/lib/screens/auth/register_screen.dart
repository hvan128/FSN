import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/auth/register_request_model.dart';
import 'package:frontend/services/auth/auth_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/i16/logo.png",
                    fit: BoxFit.contain,
                    width: 250,
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: MyColors.primary['CulturalYellow']!['c600']!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.person),
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
              borderFocusColor: MyColors.primary['CulturalYellow']!['c600']!,
              prefixIconColor: MyColors.primary['CulturalYellow']!['c600']!,
              borderColor: MyColors.primary['CulturalYellow']!['c600']!,
              textColor: MyColors.primary['CulturalYellow']!['c600']!,
              hintColor: MyColors.primary['CulturalYellow']!['c600']!.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.lock),
              "Password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Password can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                password = onSavedVal,
              },
              initialValue: "",
              obscureText: hidePassword,
              borderFocusColor: MyColors.primary['CulturalYellow']!['c600']!,
              prefixIconColor: MyColors.primary['CulturalYellow']!['c600']!,
              borderColor: MyColors.primary['CulturalYellow']!['c600']!,
              textColor: MyColors.primary['CulturalYellow']!['c600']!,
              hintColor: MyColors.primary['CulturalYellow']!['c600']!.withOpacity(0.7),
              borderRadius: 10,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.mail),
              "Email",
              "Email",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Email can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                email = onSavedVal,
              },
              initialValue: "",
              borderFocusColor: MyColors.primary['CulturalYellow']!['c600']!,
              prefixIconColor: MyColors.primary['CulturalYellow']!['c600']!,
              borderColor: MyColors.primary['CulturalYellow']!['c600']!,
              textColor: MyColors.primary['CulturalYellow']!['c600']!,
              hintColor: MyColors.primary['CulturalYellow']!['c600']!.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Register",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(
                    username: userName,
                    password: password,
                    email: email,
                  );

                      setState(() {
                        isApiCallProcess = false;
                      });
                  AuthService.register(model).then(
                    (response) {
                      if (response.data != null) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.APP_NAME,
                          "Registration Successful. Please login to the account",
                          "OK",
                          () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.APP_NAME,
                          response.message,
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: MyColors.primary['CulturalYellow']!['c100']!,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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