import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/provider/user.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImageView(
                  data: jsonEncode(userJson),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
            ),
          ),
        ));
  }
}
