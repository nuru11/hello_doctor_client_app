import 'package:get/get.dart';

import '../controllers/detail_wallet_history_controller.dart';

class DetailWalletHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWalletHistoryController>(
      () => DetailWalletHistoryController(),
    );
  }
}
