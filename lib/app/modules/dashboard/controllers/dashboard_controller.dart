import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/user_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/auth_service.dart';
import 'package:hallo_doctor_client/app/service/local_notification_service.dart';
import 'package:hallo_doctor_client/app/service/notification_service.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardController extends GetxController {
  /// index of bottom tab navigation
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
  NotificationService notificationService = Get.find<NotificationService>();

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show();
    await UserService().getUserModel();
    await LocalNotificationService().requestPermission();
    await UserService()
        .updateUserToken(await notificationService.getNotificationToken());
    if (await UserService().checkIfUserExist() == false) {
      EasyLoading.dismiss();
      AuthService().logout();
      return Get.offAllNamed('/login');
    }

    notificationService.listenNotification();
    EasyLoading.dismiss();
  }
}
