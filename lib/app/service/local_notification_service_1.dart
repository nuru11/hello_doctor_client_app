import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings(notificationIconName);

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            icon: notificationIconName, importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  void notificationTapBackground(NotificationResponse notificationResponse) {
    Get.toNamed(Routes.APPOINTMENT);
  }

  ///will set two notification one notification 10 minute before appointment time
  ///and another notification when actual appointment happen
  Future setAppointmentNotification(
      {required TimeSlot timeSlot, required Doctor doctor}) async {
    try {
      ///just to make sure the timeSlot is not null, so the app not crash
      if (timeSlot.timeSlot == null) return;
//create random id fo notification
      Random random = Random();
      int beforeTimeNotificationId = random.nextInt(1000000);
      int actualTimeNotificationId = random.nextInt(1000000);

      await setNotificationBeforeTime(
          id: beforeTimeNotificationId,
          title: 'Consultation with ${doctor.doctorName}',
          body: 'The consultation session will start in 10 Minutes}',
          notificationTime: timeSlot.timeSlot!);

      ///create notification when actual appointmet time happen
      await scheduleNotification(
          id: actualTimeNotificationId,
          title: 'Consultation with ${doctor.doctorName}',
          body: 'The Consultation session Start Now',
          scheduledNotificationDateTime: timeSlot.timeSlot!);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///will set notification before certain Duration, if you set duration to 10 minute,
  ///the notificaiton will get trigger 10 minute before notificationTime you provide,
  /// this feature is usefull for reminder
  Future setNotificationBeforeTime(
      {int id = 0,
      String title = '',
      String body = '',
      required DateTime notificationTime,
      Duration durationBefore = const Duration(minutes: 10)}) async {
    try {
      /// create notification base on duration provide
      /// timeslot notification time 10 minute before appointment
      DateTime dateTimeBeforeActualTime =
          notificationTime.subtract(durationBefore);
      await scheduleNotification(
          id: id,
          title: title,
          body: body,
          scheduledNotificationDateTime: dateTimeBeforeActualTime);
      await scheduleNotification(
          scheduledNotificationDateTime: notificationTime);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future scheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required DateTime scheduledNotificationDateTime}) async {
    return notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,
        ),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future requestPermission() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('user permission granted');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('user permission provisional');
      } else {
        print('User declie or has not accepted permission');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future removeToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? currentToken = await FirebaseMessaging.instance.getToken();
      if (currentToken != null) {
        await UserService().removeUserToken(currentToken);
      }
      await messaging.deleteToken();
    } catch (e) {
      return Future.error(e);
    }
  }
}
