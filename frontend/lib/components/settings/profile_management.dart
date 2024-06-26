import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class MyProfileContent extends StatelessWidget {
  final String? imageUrl;
  final String text;
  final String name;
  final Widget trailing;

  final void Function()? onTap;
  const MyProfileContent(
      {super.key,
      required this.text,
      required this.onTap,
      required this.name,
      this.trailing = const SizedBox(),
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: imageUrl == null ? null : NetworkImage(imageUrl!),
          backgroundColor: MyColors.primary['KiduBlue']!['c700']!,
        ),
        trailing: trailing,
        onTap: onTap,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                text: name,
                fontSize: FontSize.z16,
                fontWeight: FontWeight.w700,
                color: MyColors.grey['c700']!),
            MyText(
                text: text,
                fontSize: FontSize.z14,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c500']!)
          ],
        ),
      ),
    );
  }
}
