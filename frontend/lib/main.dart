import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/navigation/router/auth.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/navigation/routes.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';

String _defaultRoute = RouterIntroduction.introduction;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get result of the login function.
  // bool result = await SharedService.isLoggedIn();
  // if (result) {
  //   _defaultRoute = RouterHome.home;
  // }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        initialRoute: _defaultRoute,
        routes: appRoutes,
        onGenerateRoute: onAnimateRoute,
        );
  }
}
