//import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:connectycube_flutter_call_kit/connectycube_flutter_call_kit.dart'
    as call;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
//import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/modules/chat/controllers/chat_controller.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/chat_service.dart';
import 'package:hallo_doctor_client/app/service/timeslot_service.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';
import 'package:hallo_doctor_client/app/utils/styles/styles.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "high_important_channel", "High Importance Notifications",
    description: 'this channel is used for important notification',
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessaggingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('a big message just show up ' + message.messageId!);
}

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessaggingBackgroundHandler);
    setupFlutterNotification();
    setupTimezone();
  }
  void setupFlutterNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  Future listenNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        ///call notification triggered
        if (message.data['type'] == 'call') {
          ///TODO currently there's no really realiable notification call like Whatsapp available that we try, maybe in the future we can test fully working call notification

          message.data['fromName'];
          message.data['roomName'];
          message.data['token'];
          message.data['timeSlotId'];
          AndroidNotificationDetails androidPlatformChannelSpecifics =
              AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            color: Styles.primaryBlueColor,
            playSound: true,
            icon: notificationIconName,
            priority: Priority.high,
          );

          NotificationDetails platformChannelSpecific = NotificationDetails(
              android: androidPlatformChannelSpecifics,
              iOS: const DarwinNotificationDetails());

          await flutterLocalNotificationsPlugin.show(notification.hashCode,
              notification.title, notification.body, platformChannelSpecific);
        } else if (message.data['type'] == 'chat') {
          ///make sure when notification arrive we are not in chat route, because it will be annoying
          ///but we are currently not checking if this notification from this user chat or not
          if (Get.currentRoute == Routes.CHAT) {
            ChatController chatController = Get.find<ChatController>();
            if (chatController.room.id == message.data['roomId']) {
              ///notification should not showing if app opening chat with notification from same person arrive
              print(
                  'Notification chat arrive, but app opening chat with the same person');
              return;
            }
          }

          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description,
                  color: Styles.primaryBlueColor,
                  playSound: true,
                  icon: '@mipmap/ic_launcher'),
            ),
          );
        } else {
          AndroidNotificationDetails androidPlatformChannelSpecifics =
              AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description,
                  color: Styles.primaryBlueColor,
                  playSound: true,
                  icon: notificationIconName,
                  priority: Priority.high);

          NotificationDetails platformChannelSpecific = NotificationDetails(
              android: androidPlatformChannelSpecifics,
              iOS: const DarwinNotificationDetails());

          await flutterLocalNotificationsPlugin.show(notification.hashCode,
              notification.title, notification.body, platformChannelSpecific);
        }
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('a new message opened app are was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      var roomData = await ChatService().getRoomById(message.data['roomId']);
      if (notification != null && android != null) {
        Get.toNamed(Routes.CHAT, arguments: roomData);
      }
    });
  }

  void setupTimezone() async {
    tz.initializeTimeZones();
    // final String currentTimeZone =
    //     await FlutterNativeTimezone.getLocalTimezone();
    // tz.setLocalLocation(tz.getLocation(currentTimeZone));
    //printInfo(info: 'local timezone : ' + currentTimeZone);
  }

  Future onSelectNotification(String payload) async {
    // Handle notification tap event here
    Get.toNamed(Routes.APPOINTMENT);
  }

  Future<String?> getNotificationToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      print('token : $token');
      return token;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future testNotification() async {
    try {
      var callable =
          FirebaseFunctions.instance.httpsCallable('testNotification');
      await callable({
        'token': UserService.userModel?.token,
      });

      //var clientSecret = results.data;
      print('send notification : ');
      //return clientSecret;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //set local notification before appoinment time
  setNotificationAppointment(DateTime time) {
    var notificationDate = Jiffy(time).subtract(minutes: 10).dateTime;
    printInfo(
        info:
            'Date time sebelum TZ Date (dikurang 10 menit): $notificationDate');
    var myTzDatetime = tz.TZDateTime.local(
      notificationDate.year,
      notificationDate.month,
      notificationDate.day,
      notificationDate.hour,
      notificationDate.minute,
      notificationDate.second,
      notificationDate.millisecond,
    );
    printInfo(info: 'Date time setelah TZ Date $myTzDatetime');
    flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Consultation will start soon',
        "The consultation session will start in 10 minutes",
        myTzDatetime,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              color: Styles.primaryBlueColor,
              icon: '@mipmap/ic_launcher'),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
    printInfo(info: 'set local notification 10 before notification happen');
  }
}
