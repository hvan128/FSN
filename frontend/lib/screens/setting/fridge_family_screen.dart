import 'package:flutter/material.dart';
import 'package:frontend/components/modals/notification_modal.dart';
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
  @override
  void initState() {
    super.initState();
    user = Provider.of<UserProvider>(context, listen: false).user;
    print(user?.fridgeId);
    print('user: ${user!.toJson()}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      appBar: AppBar(
        title: const Text('Tủ lạnh gia đình'),
        actions: [
          IconButton(
              onPressed: scanQr,
              icon: Icon(
                Icons.qr_code,
                color: MyColors.grey['c900']!,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                color: MyColors.grey['c900']!,
              )
          ),
          SubmenuButton(
            menuChildren: <Widget>[
              MenuItemButton(
                onPressed: onPressDelete,
                child: const MenuAcceleratorLabel('&Xóa tủ lạnh gia đình'),
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
    );
  }

  void onPressDelete() {
    showModalBottomSheet(
        context: context,
        builder: (context) => MyNotification(
              title: 'Xóa tên lạnhgia đình',
              position: const ModalPosition(bottom: 50, left: 50, right: 50),
              description: 'Bạn sẽ xóa toàn bộ dữ liệu tên lạnhgia đình',
              notificationType: NotificationType.info,
              btnList: [
                MyButton(
                  text: 'Xóa',
                  onPressed: () {
                    ApiService.delete('${Config.FRIDGE_API}/${user!.fridgeId}')
                        .then((value) {
                      Provider.of<UserProvider>(context, listen: false).deleteFridge();
                      CategoryService().deleteCache();
                      Navigate.pushNamedAndRemoveAll(RouterIntroduction.afterLogin);
                    });
                  },
                )
              ]
            ));
  }

  void scanQr() {
    Navigate.pushNamed(RouterSetting.qrScanner);
  }
}
