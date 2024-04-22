

import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/widgets/text.dart';

enum NotificationType { success, error, info }

class MyNotification extends StatelessWidget {
  final NotificationType notificationType;
  final String title;
  final String description;
  final ModalPosition position;
  final String? srcIcon;
  final List<Widget> btnList;

  const MyNotification({
    super.key,
    required this.notificationType,
    required this.title,
    required this.description,
    this.position = const ModalPosition(bottom: 0, left: 0, right: 0),
    this.srcIcon = 'assets/icons/i16/logo.png',
    this.btnList = const [],
  });

  @override
  Widget build(BuildContext context) {
    Color? titleColor;
    Color? contentColor;

    switch (notificationType) {
      case NotificationType.success:
        titleColor = MyColors.primary['KiduBlue']!['c700']!;
        contentColor = MyColors.grey['c600']!;
        break;
      case NotificationType.error:
        titleColor = MyColors.support['Error']!['c900']!;
        contentColor = MyColors.grey['c600']!;
        break;
      case NotificationType.info:
        titleColor = MyColors.primary['CulturalYellow']!['c700']!;
        contentColor = MyColors.grey['c600']!;
        break;
    }

    return Stack(alignment: Alignment.center, children: [
      Positioned(
        top: position.top,
        left: position.left,
        right: position.right,
        bottom: position.bottom,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.fromLTRB(22, 28, 22, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (srcIcon != null)
                Center(
                  child: IconButton(
                    icon: Image.asset(srcIcon!, width: 76, height: 76),
                    onPressed: null,
                  ),
                ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text: title,
                    fontSize: FontSize.z20,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.2,
                    letterSpacing: -0.2,
                    textAlign: TextAlign.center,
                    color: titleColor,
                  ),
                  const SizedBox(height: 6.0),
                  MyText(
                    text: description,
                    fontSize: FontSize.z15,
                    fontWeight: FontWeight.w500,
                    color: contentColor,
                    lineHeight: 1.47,
                    letterSpacing: 0.15,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              const SizedBox(height: 28),
              if (btnList.isNotEmpty)
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: btnList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return btnList[index];
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    ]);
  }
}
