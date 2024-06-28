import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_history_model.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:hallo_doctor_client/app/service/user_wallet_service.dart';

class UserWalletController extends GetxController
    with StateMixin<List<UserWalletHistoryModel>> {
  List<UserWalletHistoryModel> listTransaction = [];
  UserWalletModel? userWallet;
  @override
  void onInit() async {
    super.onInit();
    try {
      String userId = UserService().getUserId();
      await updateBalance();
      listTransaction = await UserWalletService().getUserWalletHistory(userId);
      if (listTransaction.isNotEmpty) {
        change(listTransaction, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  Future updateBalance() async {
    String userId = UserService().getUserId();
    userWallet = await UserWalletService().getUserWallet(userId);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getTransaction() async {
    String userId = UserService().getUserId();
    listTransaction = await UserWalletService().getUserWalletHistory(userId);
    if (listTransaction.isNotEmpty) {
      change(listTransaction, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
  }

  void toTopUp() {
    Get.toNamed(Routes.TOPUP_WALLET);
  }
}
