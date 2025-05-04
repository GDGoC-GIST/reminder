import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

//how to request: NotificationService().scheduleDailyReminder(hour: ,minute: ,title: ,body:);
//immediately: NotificationService().showNotifications(title: ,body:)
class NotificationsService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = 
    FlutterLocalNotificationsPlugin();
  
  Future<void> initNotification() async {

    final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // 알림ㅣ 열렸을때.
        print('Notification payload: ${response.payload}');
      },
    );
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      iOS: DarwinNotificationDetails(),
    );
  }
  Future<void> showNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payLoad,
    );
  }

  Future<void> scheduleDailyReminder({
  required int hour,
  required int minute,
  String? title,
  String? body,
  String? payload,
  }) async {
    final scheduledTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1));
    final nextInstance = tz.TZDateTime(
      tz.local,
      scheduledTime.year,
      scheduledTime.month,
      scheduledTime.day,
      hour,
      minute,
    );

    await notificationsPlugin.zonedSchedule(
      1, // 알림 ID
      title,
      body,
      nextInstance.isBefore(tz.TZDateTime.now(tz.local))
          ? nextInstance.add(const Duration(days: 1)) // 오늘 시간이 이미 지났으면 내일로
          : nextInstance,
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
      matchDateTimeComponents: DateTimeComponents.time, // 🔁 매일 반복
    );
  }
}