import 'package:get/get.dart';

import '../controllers/paymob_kiosk_payment_controller.dart';

class PaymobKioskPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymobKioskPaymentController>(
      () => PaymobKioskPaymentController(),
    );
  }
}
