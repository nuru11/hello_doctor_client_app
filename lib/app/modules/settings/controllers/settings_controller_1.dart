import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void toDeleteAccount() {
    Get.toNamed(Routes.DELETE_ACCOUNT);
  }
}
