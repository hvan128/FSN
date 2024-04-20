import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!, 
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/i16/logo.png', 
              width: 200, 
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
