import 'dart:math';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initializeNotificationSettings() {
    //initialize for android
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_icon');
    //initialize for ios
    DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    tz.initializeTimeZones();
    //request for notification permission for android
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      //do your work when notification is tapped like open any page or link
    });
  }

  void scheduleNotification({required String title, required String body, required}) async {
    tz.setLocalLocation(tz.getLocation("Asia/Kolkata"));
    NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("Test", "TestChannerl"));
    UILocalNotificationDateInterpretation
        uiLocalNotificationDateInterpretation =
        UILocalNotificationDateInterpretation.absoluteTime;
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    flutterLocalNotificationsPlugin.zonedSchedule(
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        Random().nextInt(2000),
        title,
        body,
//schedule time
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: 400)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            uiLocalNotificationDateInterpretation);
  }

  void periodicNotification({required String title,required String body}) {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails("Test", "TestChannerl");
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    flutterLocalNotificationsPlugin.periodicallyShow(0, title,
        body, RepeatInterval.everyMinute, notificationDetails,);
  }

  void notifyMessage({required String title, required String body}) {
    NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("Test", "Test msg"),
        iOS: DarwinNotificationDetails());
    flutterLocalNotificationsPlugin.show(
        Random().nextInt(1000), title, body, notificationDetails);
  }
}
