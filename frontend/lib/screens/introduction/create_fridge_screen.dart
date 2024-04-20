import 'package:flutter/material.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
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
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserProvider>().user != null
        ? context.watch<UserProvider>().user!
        : UserModel();
    print('user:');
    print(user.toJson());
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
              onPressed: () {},
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
                        const SizedBox(height: 20),
                        MyText(
                            text: 'Xin chào, ',
                            fontSize: FontSize.z20,
                            fontWeight: FontWeight.w900,
                            color: MyColors.grey['c900']!),
                        const SizedBox(height: 10),
                        user.displayName != null
                            ? GradientText(
                                user.displayName!,
                                style: const TextStyle(fontSize: 40),
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade400,
                                  Colors.blue.shade900,
                                ]),
                              )
                            : Container(),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/i16/logo.png',
                                  width: 200, height: 200),
                            ],
                          ),
                        ),
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
                        Container(
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
                                onPressed: () {},
                                startIcon: const Icon(
                                  Icons.refresh,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ]),
                )),
          ),
        ));
  }

  void onPressCreateFridge(BuildContext context) {
    Map<String, dynamic> data = {
      "ownerId": context.read<UserProvider>().user!.id,
      "usersId": '${context.read<UserProvider>().user!.id}'
    };
    var response = ApiService.post(Config.FRIDGE_API, data);
    print('response: $response');
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
}
