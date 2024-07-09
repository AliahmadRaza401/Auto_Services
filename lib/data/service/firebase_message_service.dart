import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

import '../../utils/notification_manager.dart';

class FirebaseMessagingService {
  static final firebaseMessaging = FirebaseMessaging.instance;

  /// Function to request notification permissions
  static Future<void> init() async {
    await firebaseMessaging.requestPermission(alert: true, announcement: false, badge: true, carPlay: false, criticalAlert: false, provisional: false, sound: true);
  }

  /// Function to fetch FCM Token
  static Future<String?> getFCMToken() async {
    try {
      final token = await firebaseMessaging.getToken();
      return token;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      return e.toString();
    }
  }

  /// Function to handle foreground notification
  static Future<void> foregroundMessaging(RemoteMessage message) async {
    if (message.notification != null) {
      NotificationManager.instance.showChatNotification(title: message.notification?.title ?? '', body: message.notification?.body ?? '');
    }
  }

  /// Function to handle notification on tap
  static Future<void> messagingOnTapped(RemoteMessage message) async {
    if (message.notification != null) {
      NotificationManager.instance.showChatNotification(title: message.notification?.title ?? '', body: message.notification?.body ?? '');
    }
  }

  /// Function to handle background notification
  static Future<void> backgroundMessaging(RemoteMessage message) async {
    if (message.notification != null) {
      NotificationManager.instance.showChatNotification(title: message.notification?.title ?? '', body: message.notification?.body ?? '');
    }
  }

  /// Function to send notification
  static Future<void> sendNotification(String fcmToken, String title, String body) async {
    try {
      var jsonBody = {
        "to": fcmToken,
        "notification": {
          "title": title,
          "body": body,
        }
      };
      var url = Uri.https('fcm.googleapis.com', 'fcm/send');
      await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=BBws6ck2z75ZE1uW3LddVDu04i8o-I5wJ_1WJQiVqkvl5wZxV6tAeiiIKwbTz9nPA8a6uEIn5Kh_Oeiu0tSn4Og',
        },
        body: jsonEncode(jsonBody),
      );
    } on SocketException catch (e) {
      throw e.message;
    }
  }
}
