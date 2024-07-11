import 'package:flutter/material.dart';
import 'package:frontend/provider/notification.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/input_form.dart';
import 'package:frontend/widgets/switch_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  int days = 0;
  bool? getCommunityNotifications;
  bool? getExpirationNotification;
  @override
  void initState() {
    super.initState();
    var notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    setState(() {
      days = notificationProvider.notificationDaysInAdvance;
      getCommunityNotifications =
          notificationProvider.getCommunityNotifications;
      getExpirationNotification =
          notificationProvider.getExpirationNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    var notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50'],
      body: SafeArea(
        child: Column(
          children: [
            MyHeader(
              title: 'Cài đặt thông báo',
              bgColor: MyColors.white['c900'],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  InputForm(
                      label: 'Nhận thông báo cộng đồng',
                      content: MySwitch(
                          value: getCommunityNotifications ?? true,
                          onChange: (value) {
                            notificationProvider.setGetCommunityNotifications(
                                getCommunityNotifications: value);
                            setState(() {
                              getCommunityNotifications = value;
                            });
                          })),
                  const SizedBox(
                    height: 15,
                  ),
                  InputForm(
                      label: 'Nhận thông báo thực phẩm hết hạn',
                      content: MySwitch(
                          value: getExpirationNotification ?? true,
                          onChange: (value) {
                            notificationProvider.setExpirationNotification(
                                getExpirationNotification: value);
                            setState(() {
                              getExpirationNotification = value;
                            });
                          })),
                  const SizedBox(
                    height: 15,
                  ),
                  InputForm(
                      disable: getExpirationNotification == false,
                      label: 'Nhận thông báo hết hạn trước ngày',
                      content: Container(
                        width: 90,
                        decoration: BoxDecoration(
                            color: MyColors.primary['CulturalYellow']!['c800']!,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: MyColors.grey['c300']!,
                                blurRadius: 4,
                                offset: const Offset(1, 2),
                              )
                            ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: MyColors
                                        .primary['CulturalYellow']!['c100']!,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        if (days >= 1) {
                                          setState(() {
                                            days--;
                                            notificationProvider.setDays(
                                                days: days);
                                          });
                                        }
                                      },
                                      icon:
                                          const Icon(Icons.remove, size: 15))),
                              MyText(
                                  text: '$days',
                                  fontSize: FontSize.z15,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.white['c900']!),
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: MyColors
                                        .primary['CulturalYellow']!['c100']!,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        setState(() {
                                          days++;
                                          notificationProvider.setDays(
                                              days: days);
                                        });
                                      },
                                      icon: const Icon(Icons.add, size: 15))),
                            ]),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
