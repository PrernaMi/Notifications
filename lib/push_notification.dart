import 'package:flutter/material.dart';
import 'package:notifications/notification_helper.dart';

class PushNotification extends StatefulWidget{
  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
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
        title: Text("Notification page"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          notificationHelper.notifyMessage(title: "Text Title", body: "This is example notification");
        }, child: Text("Tap here!!")),
      ),
    );
  }
}