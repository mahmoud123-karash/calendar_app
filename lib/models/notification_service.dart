// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initiNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('app_icon');

    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {},
    );
  }

  Future notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        playSound: true,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(
        categoryIdentifier: 'thread_id',
      ),
    );
  }

  Future showNotification(
      {required int id,
      required String title,
      required String body,
      required day,
      required month,
      required year}) async {
    // tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    return flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          DateTime(year, month, day, 00, 01, 0, 0, 0),
          tz.local,
        ),
        await notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future cancelNotification1({required int id}) async {
    return await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future showOnNotification({
    required int id,
    required String title,
  }) async {
    return flutterLocalNotificationsPlugin.show(
      id,
      title,
      '',
      await notificationDetails(),
    );
  }
}
