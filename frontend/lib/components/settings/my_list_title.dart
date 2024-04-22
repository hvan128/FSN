
import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class MyListTitle extends StatelessWidget {
  final String text;
  final String src;
  final void Function()? onTap;
  final bool? deactivate;

  const MyListTitle(
      {super.key,
      required this.text,
      required this.onTap,
      this.deactivate = false,
      required this.src});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Image.asset(src, width: 24, height: 24),
        trailing: deactivate != true
            ? Image.asset("assets/icons/i16/logo.png",
                width: 16, height: 16)
            : Image.asset("assets/icons/i16/logo.png",
                width: 16, height: 16),
        onTap: onTap,
        title: Padding(
            padding:  const EdgeInsets.only(left: 8.0),
            child: MyText(
              text: text,
              color: deactivate != true
                  ? MyColors.grey['c600']!
                  : MyColors.support['Error']!['c900']!,
              fontSize: FontSize.z15,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
