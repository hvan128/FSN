import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeInvite extends StatelessWidget {
  const QRCodeInvite({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    Map<String, dynamic> userJson = {
      'id': user!.id,
      'displayName': user.displayName,
    };
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    text: 'Mã QR lời mời',
                    fontSize: FontSize.z16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c900']!),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      QrImageView(
                        data: jsonEncode(userJson),
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MyText(
                    text: 'Chủ sở hữu tủ lạnh có thể quét mã QR này bằng tính năng Quét mã QR trong phần [Cài đăt] > [Tủ lạnh gia đình] để gửi lời mời.',
                    fontSize: FontSize.z15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c900']!),
              ],
            ),
          ),
        ));
  }
}
