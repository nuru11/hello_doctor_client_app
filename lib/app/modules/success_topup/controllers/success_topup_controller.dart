import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/user_wallet/controllers/user_wallet_controller.dart';

class SuccessTopupController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animController;
  int topUpAmount = Get.arguments[0];
  UserWalletController topupWalletController = Get.find();
  @override
  void onInit() {
    super.onInit();
    animController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void gotoWallet() {
    // Get.until((route) => false);
    Get.close(1);
    topupWalletController.onInit();
  }
}
