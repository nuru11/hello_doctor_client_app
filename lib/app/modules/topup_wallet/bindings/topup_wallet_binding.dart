import 'package:get/get.dart';

import '../controllers/topup_wallet_controller.dart';

class TopupWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupWalletController>(
      () => TopupWalletController(),
    );
  }
}
