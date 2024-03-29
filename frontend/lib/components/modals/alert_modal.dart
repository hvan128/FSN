
import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';

enum AlertType { success, error, info }

enum AlertPosition {
  topLeft,
  topRight,
  topCenter,
  center,
  bottomRight,
  bottomLeft,
  bottomCenter
}

class MyAlert extends StatelessWidget {
  final AlertType alertType;
  final String title;
  final String description;
  final AlertPosition position;

  const MyAlert({
    super.key,
    required this.alertType,
    required this.title,
    required this.description,
    this.position = AlertPosition.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    Color? titleColor;
    Color? contentColor;
    IconData? icon;
    const failIcon = 'assets/icons/i16/failed.png';
    const successIcon = 'assets/icons/i16/success.png';

    switch (alertType) {
      case AlertType.success:
        titleColor = Colors.green;
        contentColor = MyColors.grey['c700']!;
        icon = Icons.check_circle;
        break;
      case AlertType.error:
        titleColor = Colors.red;
        contentColor = Colors.red[800];
        icon = Icons.error;
        break;
      case AlertType.info:
        titleColor = Colors.blue;
        contentColor = Colors.blue[800];
        icon = Icons.info;
        break;
    }

    const duration = Duration(seconds: 1);

    Future.delayed(duration, () {
      Navigator.of(context).pop();
    });

    double? top;
    double? left;
    double? right;
    double? bottom;

    switch (position) {
      case AlertPosition.topLeft:
        left = 0;
        top = 10;
        break;
      case AlertPosition.topRight:
        left = 1;
        top = 10;
        break;
      case AlertPosition.topCenter:
        left = 0.5;
        right = 0.5;
        top = 10;
        break;
      case AlertPosition.center:
        top = MediaQuery.of(context).size.height / 3;
        break;
      case AlertPosition.bottomRight:
        left = 1;
        bottom = 10;
        break;
      case AlertPosition.bottomLeft:
        left = 0;
        bottom = 10;
        break;
      case AlertPosition.bottomCenter:
        left = 0.5;
        bottom = 10;
        break;
    }
    return Stack(children: [
      Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(
                top: 27.0,
                bottom: 24.0,
                left: 22.0,
                right: 22.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconButton(
                        icon: alertType == AlertType.success
                            ? Image.asset(successIcon, width: 70, height: 70)
                            : Image.asset(failIcon, width: 70, height: 70),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                          text: title,
                          fontSize: FontSize.z30,
                          fontWeight: FontWeight.bold,
                          color: titleColor),
                      const SizedBox(height: 6.0),
                      MyText(
                          text: description,
                          fontSize: FontSize.z15,
                          fontWeight: FontWeight.w600,
                          color: contentColor!)
                    ],
                  ),
                ],
              ),
            ),
          )),
    ]);
  }
}
