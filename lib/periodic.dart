import 'package:flutter/material.dart';
import 'package:notifications/notification_helper.dart';


class PeriodicNotification extends StatefulWidget {
  @override
  State<PeriodicNotification> createState() => _ScheduleNotificationState();
}

class _ScheduleNotificationState extends State<PeriodicNotification> {
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
        title: Center(child: Text("Periodic Notification")),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              notificationHelper.periodicNotification(
                  title: "Notification", body: "This is Periodic Notification");
            },
            child: Text("Tap me!!")),
      ),
    );
  }
}
