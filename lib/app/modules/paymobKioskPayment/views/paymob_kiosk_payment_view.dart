import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/widgets/submit_button.dart';

import '../controllers/paymob_kiosk_payment_controller.dart';

class PaymobKioskPaymentView extends GetView<PaymobKioskPaymentController> {
  const PaymobKioskPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You should go to any market to pay',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'This is your ref code',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: Border.all(color: Color(0xB2DB0404), width: 1),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.kioskRefCode,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              SubmitButton(
                  onTap: () {
                    controller.checkPaymentStatus();
                  },
                  text: "Confirm Payment"),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
