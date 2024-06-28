import 'package:get/get.dart';

import '../controllers/user_wallet_controller.dart';

class UserWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserWalletController>(
      () => UserWalletController(),
    );
  }
}
