import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/navigation/routes.dart';
import 'package:frontend/provider/category.dart';
import 'package:frontend/services/notification/firebase_messaging.dart';
import 'package:frontend/provider/google_sign_in.dart';
import 'package:frontend/provider/notification.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

String _defaultRoute = RouterIntroduction.introduction;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool result = await SharedService.isLoggedIn();
  if (result) {
    await GoogleSignInProvider().refreshToken();
    Timer.periodic(const Duration(seconds: 3601), (timer) async {
      await GoogleSignInProvider().refreshToken();
    });
    _defaultRoute = RouterIntroduction.afterLogin;
  }
  FirebaseMessagingService.initializeNotification();
    List<NotificationModel> scheduledNotifications =
        await AwesomeNotifications().listScheduledNotifications();
    print('scheduledNotifications: ${scheduledNotifications.length}');
    for (var schedule in scheduledNotifications) {
      print('schedule: $schedule');
    }
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static final navigate = Navigate();
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
        title: Config.APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Urbanist',
              ),
          cardTheme: CardTheme(
            surfaceTintColor: MyColors.white['c900'],
          ),
          tabBarTheme: TabBarTheme(
              labelColor: MyColors.grey['c800'],
              unselectedLabelColor: MyColors.grey['c600'],
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: FontSize.z16,
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: FontSize.z17,
              ),
              indicator: UnderlineTabIndicator(
                // color for indicator (underline)
                borderSide: BorderSide(
                    color: MyColors.primary['CulturalYellow']!['c700']!,
                    width: 2.0),
              )),
          primaryColor: MyColors.primary['CulturalYellow']!['c700'],
          bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              modalElevation: 0),
          useMaterial3: true,
        ).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(outline: MyColors.white['c900']),
        ),
        navigatorKey: navigate.navigationKey,
        initialRoute: _defaultRoute,
        routes: appRoutes,
        onGenerateRoute: onAnimateRoute,
      ),
    );
  }
}
