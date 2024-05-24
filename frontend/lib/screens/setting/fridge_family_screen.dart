import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/components/settings/more_info.dart';
import 'package:frontend/components/settings/profile_management.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/introduction.dart';
import 'package:frontend/navigation/router/settings.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/widgets/button.dart';
import 'package:provider/provider.dart';

class FridgeFamilySettingScreen extends StatefulWidget {
  const FridgeFamilySettingScreen({super.key});

  @override
  State<FridgeFamilySettingScreen> createState() =>
      _FridgeFamilySettingScreenState();
}

class _FridgeFamilySettingScreenState extends State<FridgeFamilySettingScreen> {
  UserModel? user;
  int? ownerId;
  @override
  void initState() {
    super.initState();
    user = Provider.of<UserProvider>(context, listen: false).user;
    getFridge();
  }

  void getFridge() async {
    final fridge =
        await ApiService.get('${Config.FRIDGE_API}/${user!.fridgeId}');
    setState(() {
      ownerId = jsonDecode(fridge)[0]['ownerId'];
    });
  }

  bool isOwner() {
    return ownerId == user!.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      appBar: AppBar(
        title: const Text('Tủ lạnh gia đình'),
        actions: [
          isOwner()
              ? IconButton(
                  onPressed: scanQr,
                  icon: Icon(
                    Icons.qr_code,
                    color: MyColors.grey['c900']!,
                  ))
              : Container(),
          isOwner()
              ? IconButton(
                  onPressed: moreInformation,
                  icon: Icon(
                    Icons.help_outline,
                    color: MyColors.grey['c900']!,
                  ))
              : Container(),
          SubmenuButton(
            menuChildren: <Widget>[
              isOwner()
                  ? MenuItemButton(
                      onPressed: onPressDelete,
                      child:
                          const MenuAcceleratorLabel('&Xóa tủ lạnh gia đình'),
                    )
                  : MenuItemButton(
                      onPressed: onPressLeave,
                      child: const MenuAcceleratorLabel('&Rời khỏi tủ lạnh'),
                    ),
              MenuItemButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saved!'),
                    ),
                  );
                },
                child: const MenuAcceleratorLabel('&Save'),
              ),
              MenuItemButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Quit!'),
                    ),
                  );
                },
                child: const MenuAcceleratorLabel('&Quit'),
              ),
            ],
            child: Icon(
              Icons.more_vert,
              color: MyColors.grey['c900']!,
            ),
          ),
        ],
      ),
      body: body(),
    );
  }

  void onPressDelete() {
    showModalBottomSheet(
        context: context,
        builder: (context) => MyNotification(
                title: 'Xóa tủ lạnh gia đình',
                position: const ModalPosition(bottom: 50, left: 50, right: 50),
                description:
                    'Bạn có chắc chắn muốn xóa hoàn toàn dữ liệu tủ lạnh gia đình không? Các thành viên khác cũng sẽ mất quyền truy cập vào tủ lạnh.',
                notificationType: NotificationType.info,
                btnList: [
                  MyButton(
                    text: 'Hủy bỏ',
                    onPressed: () {},
                    buttonType: ButtonType.delete,
                  ),
                  MyButton(
                    text: 'Xóa',
                    onPressed: () {
                      ApiService.delete(
                              '${Config.FRIDGE_API}/${user!.fridgeId}')
                          .then((value) {
                        var userProvider =
                            Provider.of<UserProvider>(context, listen: false);
                        userProvider.deleteFridge();
                        APICacheManager()
                            .deleteCache('user_${userProvider.user!.id}');
                        CategoryService().deleteCache();
                        Navigate.pushNamedAndRemoveAll(
                            RouterIntroduction.afterLogin);
                      });
                    },
                  )
                ]));
  }

  void scanQr() {
    Navigate.pushNamed(RouterSetting.qrScanner);
  }

  void onPressLeave() {
    UserModel userDeleteFridge = user!.deleteFridge();
    showDialog(
        context: context,
        builder: (context) => Align(
              alignment: Alignment.center,
              child: MyNotification(
                  title: 'Rời khỏi tủ lạnh gia đình',
                  description: '½ sẽ rời khỏi toàn bộ dữ liệu tên lạnhgia đình',
                  notificationType: NotificationType.info,
                  btnList: [
                    MyButton(
                        text: 'Rời',
                        onPressed: () {
                          ApiService.put(
                                  Config.USER_API, userDeleteFridge.toJson())
                              .then((value) {
                            var userProvider = Provider.of<UserProvider>(
                                context,
                                listen: false);
                            userProvider.deleteFridge();
                            APICacheManager()
                                .deleteCache('user_${userProvider.user!.id}');
                            CategoryService().deleteCache();
                            Navigate.pushNamedAndRemoveAll(
                                RouterIntroduction.afterLogin);
                          });
                        })
                  ]),
            ));
  }

  Future<List<UserModel>> getUsers() async {
    List<UserModel> listUsers = [];
    await ApiService.get('${Config.USER_API}/fridge/${user!.fridgeId}')
        .then((value) {
      if (value != null && value != 'No data') {
        final data = jsonDecode(value.toString())['data'];
        listUsers = userFromJson(data);
      }
    });
    return listUsers;
  }

  body() {
    return FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              print('snapshot.data: ${snapshot.data}');
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                print('snapshot.data: ${snapshot.data}');
                return Column(
                  children: [
                    ...snapshot.data!.map((userFridge) {
                      bool isMine = userFridge.id == user!.id;
                      bool isOwner = userFridge.id == ownerId;
                      String bonusText = isMine ? '( Tôi )' : '';
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 8, left: 8, bottom: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.white['c900'],
                          ),
                          child: Column(
                            children: [
                              MyProfileContent(
                                text: isOwner ? 'Chủ sở hữu' : 'Thành viên',
                                onTap: () {
                                  onTapProfileContent(userFridge);
                                },
                                name: '${userFridge.displayName} $bonusText',
                                imageUrl: userFridge.imageUrl,
                                trailing: !isOwner
                                    ? const Icon(Icons.more_vert)
                                    : const SizedBox(),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                );
              } else {
                return const Center(child: Text('No data'));
              }
          }
        });
  }

  void onTapProfileContent(UserModel userFridge) {}

  void moreInformation() {
    showDialog(context: context, builder: (context) => const MoreInfo());
  }
}
