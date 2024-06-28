import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';

class PaymobKioskPaymentController extends GetxController {
  //TODO: Implement PaymobKioskPaymentController

  String kioskRefCode = Get.arguments[1];
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

  void checkPaymentStatus() async {
    try {
      var isConfirm = await Get.defaultDialog<bool>(
          title: 'Confirmation',
          middleText: 'Are you sure you have completed the payment'.tr,
          textCancel: 'Cancel',
          textConfirm: 'OK',
          onCancel: () {},
          onConfirm: () {
            Get.toNamed(Routes.DASHBOARD);
          });
      if (isConfirm != null && isConfirm) {
        EasyLoading.show(status: 'Saving...');

        /// Start the operation
        EasyLoading.dismiss();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
