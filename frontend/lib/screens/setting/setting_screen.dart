// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend/components/settings/my_list_title.dart';
import 'package:frontend/components/settings/profile_management.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/navigation/router/settings.dart';
import 'package:frontend/provider/google_sign_in.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void clickNextProfileScreen() {
  }

  void clickNextFridgeFamilyScreen() {
    Navigate.pushNamed(RouterSetting.fridgeFamily);
  }

  void clickNextNotificationScreen() {
  }

  void clickNextContactUsScreen() {
  }

  void clickDeActiveApp() {
  }

  void clickLogout() async {
    Loading.showLoading();
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    await provider.logout();
    SharedService.logout();
    await Future.delayed(const Duration(seconds: 1));
    Loading.hideLoading();
    Navigate.pushNamedAndRemoveAll(RouterIntroduction.introduction);
  }

  void onTapPrivacyPolicy() {
    Navigate.pushNamed('/faq');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white["c900"]!,
      body: SafeArea(
        child: Container(
          color: MyColors.primary['KiduBlue']!['c50']!,
          child: Column(children: [
            MyHeader(
              disableLeftButton: true,
              bgColor: MyColors.white['c900'],
              title: 'Setting',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 80,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 8,left: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyColors.white['c900'],
                              ),
                              child: Column(
                                children: [
                                  MyProfileContent(
                                    text: 'Profile management',
                                    name: 'Machs Do',
                                    onTap: clickNextProfileScreen,
                                  )
                                ],
                              ),
                            ),
                          ), //security list title
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyColors.white['c900'],
                              ),
                              child: Column(
                                children: [
                                  MyListTitle(
                                    src: 'assets/icons/i16/logo.png',
                                    text: 'Tủ lạnh gia đình',
                                    onTap: clickNextFridgeFamilyScreen,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 22, left: 22),
                                    child: MyDivider(
                                        type: Type.solid,
                                        bdColor: MyColors.grey['c100']!),
                                  ),
                                  //Notifications list title
                                  MyListTitle(
                                    src: 'assets/icons/i16/logo.png',
                                    text: 'Notifications',
                                    onTap: clickNextNotificationScreen,
                                  ), //security list title
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyColors.white['c900'],
                              ),
                              child: Column(
                                children: [
                                  MyListTitle(
                                    src: 'assets/icons/i16/logo.png',
                                    text: 'Contact us',
                                    onTap: clickNextContactUsScreen,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 22, left: 22),
                                    child: MyDivider(
                                        type: Type.solid,
                                        bdColor: MyColors.grey['c100']),
                                  ),
                                  MyListTitle(
                                    src: 'assets/icons/i16/logo.png',
                                    text: 'Terms and conditions',
                                    onTap: onTapPrivacyPolicy,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 22, left: 22),
                                    child: MyDivider(
                                        type: Type.solid,
                                        bdColor: MyColors.grey['c100']),
                                  ),
                                  MyListTitle(
                                    src:
                                        'assets/icons/i16/logo.png',
                                    text: 'Privacy policy',
                                    onTap: onTapPrivacyPolicy,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyColors.white['c900'],
                              ),
                              child: Column(
                                children: [
                                  MyListTitle(
                                    src:
                                        'assets/icons/i16/logo.png',
                                    text: 'Deactivate app',
                                    deactivate: true,
                                    onTap: clickDeActiveApp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: MyDivider(
                                type: Type.solid,
                                bdWidth: 0.5,
                              )),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: ListTile(
                              trailing: MyText(
                                  text: 'Version: 1.1.1',
                                  fontSize: FontSize.z12,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.grey['c600']!),
                              onTap: clickLogout,
                              title: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    MyText(
                                        text: "Logout",
                                        color:
                                            MyColors.support['Error']!['c900']!,
                                        fontSize: FontSize.z15,
                                        fontWeight: FontWeight.w600),
                                    Image.asset(
                                        "assets/icons/i16/logo.png",
                                        width: 16,
                                        height: 16),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
