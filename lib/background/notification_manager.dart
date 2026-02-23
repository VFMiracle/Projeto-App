import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//DESC: Manages the display process for Notifications
class NotificationManager{
  static final NotificationManager _ntfctnManager = NotificationManager._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNtfctnsPlugin = FlutterLocalNotificationsPlugin();

  NotificationManager._internal();

  factory NotificationManager() => _ntfctnManager;

  void startup() async {
    const  AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNtfctnsPlugin.initialize(settings: initializationSettings);
  }

  void cancelCronometer(){
    flutterLocalNtfctnsPlugin.cancel(id: 0);
  }

  void displayCronometer(String name, String counterStatus) {
    const AndroidNotificationDetails androidCrnmtrDetails = AndroidNotificationDetails(
      'cronometer',
      'Cronometer',
      channelDescription: 'The background representation of the cronometer.',
      color: Color.fromARGB(255, 46, 156, 239),
      ongoing: true,
      playSound: false,
      priority: Priority.low,
      importance: Importance.low,
      styleInformation: BigTextStyleInformation(''),
    );
    const NotificationDetails cronometerDetails = NotificationDetails(android: androidCrnmtrDetails);
    flutterLocalNtfctnsPlugin.show(
      id: 0,
      title: name,
      body: counterStatus,
      notificationDetails: cronometerDetails,
    );
  }
}