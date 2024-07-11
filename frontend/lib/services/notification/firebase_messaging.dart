import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/main.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/home.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/services/notification/local_notification.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:provider/provider.dart';

class FirebaseMessagingService {
  static Future<void> initializeNotification() async {
    NotificationService.initializeNotification();
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    //If app is in Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published! ${message.data}');
      Navigate.push(MaterialPageRoute(builder: (context) {
        return const HomeScreen(tabIndex: 3,);
      }));
    });
    //If app is closed or terminated
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print('Initial message: ${message?.data}');
      if (message != null) {
        Navigate.push(MaterialPageRoute(builder: (context) {
          return const HomeScreen(tabIndex: 3,);
        }));
      }
    });
   
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    print('Handling a background message ${message.messageId}');
    showFlutterNotification(message);
  }

  static void showFlutterNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (message.data['type'] == 'schedule') {
      if (notification != null && android != null) {
        NotificationService.showNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
          id: int.parse(message.data['id']),
          scheduled: true,
          time: DateTime.parse(message.data['time']),
        );
      }
    } else if (message.data['type'] == 'category') { 
      await CategoryService().deleteCache();
      Navigate.pushNamed(RouterHome.home);
      if (notification != null && android != null) {
        NotificationService.showNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
        );
      }
    } else if (message.data['type'] == 'community') { 
      if (notification != null && android != null) {
        NotificationService.showNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
        );
      }
    } else {
      if (notification != null && android != null) {
        NotificationService.showNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
        );
      }
    }
  }

  static Future<void> storageFcmToken() async {
    FirebaseMessaging.instance.getToken().then((value) {
      final user = Provider.of<UserProvider>(
              MainApp.navigate.navigationKey.currentContext!,
              listen: false)
          .user!;
      user.fcmToken = value;
      ApiService.put('${Config.USER_API}}', user.toJson());
    });
  }
}
