import 'package:get/get.dart';

import '../controllers/paymob_card_payment_controller.dart';

class PaymobCardPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymobCardPaymentController>(
      () => PaymobCardPaymentController(),
    );
  }
}
