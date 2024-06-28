import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/user_wallet_service.dart';

import '../../../service/payment_service.dart';
import '../../../service/user_service.dart';
import '../../../utils/constants/constants.dart';

class TopupWalletController extends GetxController {
  var formKey = GlobalKey<FormBuilderState>();
  PaymentService paymentService = PaymentService();
  final UserService userService = Get.find();
  final int minimumTopUpAmount = 1;
  final int maximumTopUpAmount = 1000;

  @override
  void onInit() async {
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

  void payWithStripe(int amount) async {
    EasyLoading.show();
    try {
      var clientSecret = await paymentService.createOrderTopUpStripe(
          amount, userService.getUserId());
      if (clientSecret.isEmpty) return;

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: appName,
        paymentIntentClientSecret: clientSecret,
      ));
      EasyLoading.dismiss();
      await Stripe.instance.presentPaymentSheet();
      Get.offNamed(Routes.SUCCESS_TOPUP, arguments: [amount]);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void topUpWallet() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      int amount = int.parse(formKey.currentState!.value['amount']);
      var data = await Get.defaultDialog<bool>(
          title: 'Confirmation',
          middleText:
              'Are you sure you want to Top Up \$$amount  your wallet'.tr,
          textCancel: 'Cancel',
          textConfirm: 'OK',
          onCancel: () {},
          onConfirm: () {
            Get.back(result: true);
          });
      if (data != null && data) {
        EasyLoading.show(status: 'Saving...');
        if (formKey.currentState!.value['payment_method'] == 'Stripe') {
          payWithStripe(amount);
        } else {
          print(formKey.currentState!.value['payment_method']);
        }
        EasyLoading.dismiss();
      }
    }
  }
}
