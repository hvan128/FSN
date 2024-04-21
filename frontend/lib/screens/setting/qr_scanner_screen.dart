// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  UserModel? receivedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
                borderWidth: 10,
                borderLength: 20,
                borderRadius: 10,
                borderColor: MyColors.primary['CulturalYellow']!['c700']!,
              )),
          receivedUser != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: MyNotification(
                    description:
                        'Bạn có muốn gửi lời mời tới: ${receivedUser!.displayName}',
                    notificationType: NotificationType.success,
                    title: 'Gửi lời mời',
                    btnList: [
                      MyButton(
                        text: 'Đồng ý',
                        onPressed: createInvite,
                      )
                    ],
                  ),
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white24,
                        ),
                        child: MyText(
                          text:
                              'Vui lòng quét mã QR của thành viên bạn muốn mời',
                          color: MyColors.white['c900']!,
                          fontSize: FontSize.z14,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        final data = jsonDecode(scanData.code!);
        final user = UserModel.fromJson(data);
        setState(() {
          receivedUser = user;
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void createInvite() async {
    Loading.showLoading();
    final senderId = Provider.of<UserProvider>(context, listen: false).user!.id;
    final fridgeId =
        Provider.of<UserProvider>(context, listen: false).user!.fridgeId;
    await ApiService.post(Config.INVITATION_API, {
      'senderId': senderId,
      'receiverId': receivedUser!.id,
      'fridgeId': fridgeId
    });
    Loading.hideLoading();
    Navigate.pop();
    showDialog(
        context: context,
        builder: (context) {
          return MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description:
                'Đã gửi lời mời tới ${receivedUser!.displayName} thành công!',
          );
        });
  }
}
