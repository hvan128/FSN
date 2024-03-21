import 'package:flutter/material.dart';
import 'package:frontend/screen/home_screen.dart';
import 'package:frontend/theme/color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DK Mobile Banking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Urbanist',
              ),
          cardTheme: CardTheme(
            surfaceTintColor: MyColors.white['c900'],
          ),
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
        home: const HomeScreen());
  }
}
