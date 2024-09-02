import 'package:get/get.dart';

import '../controllers/detail_transaction_wallet_controller.dart';

class DetailTransactionWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransactionWalletController>(
      () => DetailTransactionWalletController(),
    );
  }
}
