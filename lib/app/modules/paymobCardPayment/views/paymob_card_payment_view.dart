import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/utils/styles/styles.dart';

import '../controllers/paymob_card_payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobCardPaymentView extends GetView<PaymobCardPaymentController> {
  const PaymobCardPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with Card'),
        backgroundColor: Styles.primaryBlueColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Transform.rotate(
            angle: 180 * math.pi / 180,
            child: const Icon(Icons.exit_to_app),
          ),
        ),
      ),
      body: WebViewWidget(
        controller: controller.webViewController,
      ),
    );
  }
}
