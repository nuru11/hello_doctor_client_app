import 'package:get/get.dart';

import '../controllers/success_topup_controller.dart';

class SuccessTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessTopupController>(
      () => SuccessTopupController(),
    );
  }
}
