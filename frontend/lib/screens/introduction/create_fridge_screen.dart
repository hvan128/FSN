// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/introduction/qr_code_invite.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/invitation/invitation.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/gradient_text.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class CreateFridgeScreen extends StatefulWidget {
  const CreateFridgeScreen({super.key});

  @override
  State<CreateFridgeScreen> createState() => _CreateFridgeScreenState();
}

class _CreateFridgeScreenState extends State<CreateFridgeScreen> {
  Future<List<Invitation>> getInvitations(int receiverId) async {
    List<Invitation> invitations = [];
    await ApiService.get('${Config.INVITATION_API}/$receiverId').then((value) {
      print('value: $value');
      if (value != null && value != 'No data') {
        final data = jsonDecode(value.toString())['data'];
        print('data: $data');
        invitations = invitationFromJson(data);
      }
    });
    return invitations;
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserProvider>().user != null
        ? context.watch<UserProvider>().user!
        : UserModel();
    var futureBuilder = FutureBuilder(
      future: getInvitations(user.id!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            print('snapshot.data: ${snapshot.data}');
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data.length > 0) {
              return createListView(context, snapshot);
            } else {
              return createReloadButton();
            }
        }
      },
    );
    return Scaffold(
        backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
        appBar: AppBar(
          title: MyText(
              text: Config.APP_NAME,
              color: MyColors.grey['c900']!,
              fontWeight: FontWeight.w700,
              fontSize: FontSize.z20),
          actions: [
            IconButton(
              onPressed: onPressQRCode,
              icon: const Icon(
                Icons.qr_code,
                color: Colors.black,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                color: MyColors.primary['CulturalYellow']!['c50']!,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        MyText(
                            text: 'Xin chào, ',
                            fontSize: FontSize.z20,
                            fontWeight: FontWeight.w900,
                            color: MyColors.grey['c900']!),
                        user.displayName != null
                            ? GradientText(
                                user.displayName!,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade400,
                                  Colors.blue.shade900,
                                ]),
                              )
                            : Container(),
                        // const SizedBox(height: 20),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Image.asset('assets/icons/i16/logo.png',
                        //           width: 150, height: 150),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        MyText(
                            text: 'Bắt đầu làm chủ sở hữu',
                            fontSize: FontSize.z20,
                            fontWeight: FontWeight.w900,
                            color: MyColors.grey['c700']!),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: MyColors.grey['c100']!,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      MyColors.grey['c500']!.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(0, 5),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                  text:
                                      'Tạo một tủ lạnh cho gia đình và trở thành chủ sở hữu của nó',
                                  fontSize: FontSize.z15,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.grey['c700']!),
                              const SizedBox(height: 10),
                              MyText(
                                  text:
                                      'Bạn có thể mời thành viên khác tham gia quản lý cùng',
                                  fontSize: FontSize.z15,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.grey['c700']!),
                              const SizedBox(height: 20),
                              MyButton(
                                text: 'Tạo tủ lạnh',
                                onPressed: () {
                                  onPressCreateFridge(context);
                                },
                                buttonType: ButtonType.primary,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        MyText(
                            text: 'Tham gia với tư cách thành viên',
                            fontSize: FontSize.z20,
                            fontWeight: FontWeight.w900,
                            color: MyColors.grey['c700']!),
                        const SizedBox(height: 20),
                        futureBuilder,
                        const SizedBox(height: 40),
                      ]),
                )),
          ),
        ));
  }

  void onPressCreateFridge(BuildContext context) async {
    Map<String, dynamic> data = {
      "ownerId": context.read<UserProvider>().user!.id,
      "usersId": '${context.read<UserProvider>().user!.id}'
    };
    await ApiService.post(Config.FRIDGE_API, data).then((value) async {
      final fridgeId = jsonDecode(value.toString())['id'];
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setFridge(fridgeId: fridgeId);
      await ApiService.get('${Config.USER_API}/${userProvider.user!.id}')
          .then((value) {
        if (value != null) {
          APICacheDBModel cacheDBModel = APICacheDBModel(
            key: 'user_${userProvider.user!.id}',
            syncData: value.toString(),
          );
          APICacheManager().addCacheData(cacheDBModel);
        }
      });
    });
    Navigator.pushNamedAndRemoveUntil(context, RouterHome.home, (_) => false);
    showDialog(
        context: context,
        builder: (context) {
          return const MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description:
                'Tạo tủ lạnh thành công! Hãy thêm đồ ăn vào tủ lạnh để quản lý nhé!',
          );
        });
  }

  void onPressQRCode() {
    showDialog(context: context, builder: (context) => const QRCodeInvite());
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    final data = snapshot.data;
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: MyColors.grey['c100']!,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: MyColors.grey['c500']!.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 5),
              )
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...data.map(
            (data) => FutureBuilder(
                future: getSenderName(data.senderId),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Row(children: [
                        Icon(Icons.mail, color: MyColors.grey['c700']!),
                        const SizedBox(width: 10),
                        MyText(
                          text: 'Lời mời từ ${snapshot.data.toString()}',
                          fontSize: FontSize.z15,
                          fontWeight: FontWeight.w700,
                          color: MyColors.grey['c700']!,
                        )
                      ]),
                      const SizedBox(height: 20),
                      MyButton(
                          text: 'Tham gia',
                          onPressed: () {
                            onPressJoinFridge(data);
                          },
                          buttonType: ButtonType.secondary),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
          ),
        ]));
  }

  Widget createReloadButton() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.grey['c100']!,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColors.grey['c500']!.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 5),
            )
          ]),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
              text:
                  'Khi chạm vào biểu tượng QR ở phía trên màn hình, mã QR lời mời sẽ được hiển thị. Hãy gửi nó cho chủ tủ lạnh và yêu cầu một lời mời.',
              fontSize: FontSize.z15,
              fontWeight: FontWeight.w700,
              color: MyColors.grey['c700']!),
          const SizedBox(height: 20),
          MyButton(
            text: 'Làm mới',
            buttonType: ButtonType.disable,
            onPressed: () {
              setState(() {});
            },
            startIcon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
    );
  }

  Future<String> getSenderName(int senderId) async {
    String senderName = '';
    await ApiService.get('${Config.USER_API}/$senderId').then((value) {
      if (value != null) {
        senderName = jsonDecode(value.toString())[0]['displayName'];
      }
    });
    return senderName;
  }

  void onPressJoinFridge(Invitation invitation) async {
    final acceptInvitation = invitation.acceptInvitation();
    Loading.showLoading();
    await ApiService.put(Config.INVITATION_API, acceptInvitation.toJson());
    final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setFridge(fridgeId: invitation.fridgeId!);
      await ApiService.get('${Config.USER_API}/${userProvider.user!.id}')
          .then((value) {
        if (value != null) {
          APICacheDBModel cacheDBModel = APICacheDBModel(
            key: 'user_${userProvider.user!.id}',
            syncData: value.toString(),
          );
          APICacheManager().addCacheData(cacheDBModel);
        }
      });
    Loading.hideLoading();
    Navigator.pushNamedAndRemoveUntil(context, RouterHome.home, (_) => false);
  }
}
