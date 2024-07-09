import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../widgets/widgets_imports.dart';

class NotificationManager extends GetxController {
  static NotificationManager get instance => Get.find();

  static const _chatNotificationChannel = AndroidNotificationDetails(
    'chat_messages',
    'Chat messages',
    color: KColors.kTcolor,
    playSound: true,
    importance: Importance.max,
    priority: Priority.max,
    enableVibration: true,
    channelShowBadge: true,
  );

  late final FlutterLocalNotificationsPlugin _notificationsPlugin;

  Future<void> initialize() async {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidSettings = AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );

    const iosSettings = IOSInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  Future selectNotification(String? payload) {
    throw UnimplementedError();
  }

  Future<void> showChatNotification({
    required String title,
    required String body,
  }) async {
    await _notificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(
        android: _chatNotificationChannel,
      ),
    );
  }
}
