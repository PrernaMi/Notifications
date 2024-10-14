import 'package:flutter/material.dart';
import 'package:notifications/notification_helper.dart';


class ScheduleNotification extends StatefulWidget {
  @override
  State<ScheduleNotification> createState() => _ScheduleNotificationState();
}

class _ScheduleNotificationState extends State<ScheduleNotification> {
  NotificationHelper notificationHelper = NotificationHelper();

  @override
  void initState() {
    notificationHelper.initializeNotificationSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Schedule Notification")),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              notificationHelper.scheduleNotification(
                  title: "Notification", body: "This is Schedule Notification");
            },
            child: Text("Tap me!!")),
      ),
    );
  }
}
