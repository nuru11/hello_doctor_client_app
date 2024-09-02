import 'dart:ui';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobCardPaymentController extends GetxController {
  //TODO: Implement PaymobCardPaymentController

  final count = 0.obs;
  String paymobCardToken = Get.arguments[0];
  TimeSlot selectedTimeSlot = Get.arguments[1];
  late WebViewController webViewController;
  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('on progress url : ' + progress.toString());
          },
          onPageStarted: (String url) {
            print('on page started url : ' + url);
          },
          onPageFinished: (String url) {
            print('url : ' + url);
            if (url.contains(paymobRedirectUrl)) {
              Get.toNamed(Routes.PAYMENT_SUCCESS, arguments: selectedTimeSlot);
            }
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/790640?payment_token=$paymobCardToken'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
