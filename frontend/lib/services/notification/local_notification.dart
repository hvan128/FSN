import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/notification/announcement_model.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/services/api_service.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: 'Group 1',
        )
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  /// Use this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  /// Use this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  /// Use this method to detect when the user taps on a notification or action button
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == "true") {
      MainApp.navigate.navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    }
  }

  static Future<void> showNotification(
      {required final String title,
      required final String body,
      final String? summary,
      final Map<String, String>? payload,
      final ActionType actionType = ActionType.Default,
      final NotificationLayout notificationLayout = NotificationLayout.Default,
      final NotificationCategory? category,
      final String? bigPicture,
      final List<NotificationActionButton>? actionButtons,
      final bool scheduled = false,
      final DateTime? time,
      final int? id}) async {
    assert(!scheduled || (scheduled && time != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id ?? -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationCalendar(
              day: time!.day,
              hour: time.hour,
              minute: time.minute,
              second: time.second,
              millisecond: time.millisecond,
              timeZone:
                  await AwesomeNotifications().getLocalTimeZoneIdentifier(),
              preciseAlarm: true,
            )
          : null,
    );
  }

  static Future<void> cancelScheduledNotification(
      {required final int id}) async {
    await AwesomeNotifications().cancel(id);
  }

  static Future<List<Announcement>> getCommunityNotifications(
      {required int targetId}) async {
    List<Announcement> list = [];

    await ApiService.get('${Config.NOTIFICATION_API}/community/$targetId')
        .then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        list = announcementFromJson(data);
      }
    });
    return list;
  }

  static Future<List<Announcement>> getFridgeNotifications(
      {required int fridgeId, int? page, int? pageSize}) async {
    List<Announcement> list = [];
    // final queryParams = {
    //   'page': page?.toString(),
    //   'pageSize': pageSize?.toString(),
    // };
    await ApiService.get('${Config.NOTIFICATION_API}/fridge/$fridgeId')
        .then((value) {
      if (value != null) {
        final data = jsonDecode(value.toString())['data'];
        print('data: $data');
        list = announcementFromJson(data);
      }
    });
    return list;
  }

  static Future<void> readNotification({required int id}) async {
    await ApiService.put('${Config.NOTIFICATION_API}/read/$id', {});
  }
}
