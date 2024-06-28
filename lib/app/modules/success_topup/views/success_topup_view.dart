import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hallo_doctor_client/app/utils/timeformat.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/constants/style_constants.dart';
import '../controllers/success_topup_controller.dart';

class SuccessTopupView extends GetView<SuccessTopupController> {
  const SuccessTopupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top Up Success'.tr),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  child: Lottie.asset('assets/animations/done.json',
                      height: 250,
                      repeat: false,
                      controller: controller.animController,
                      onLoaded: (composition) {
                    controller.animController.forward();
                  })),
              Text(
                'Top Up Payment Successfull'.tr,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.green),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your payment has been processed! \n Details of transaction are included below'
                    .tr,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: mSubtitleColor),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('TOTAL TOP UP'.tr),
                  Text(currencySign + controller.topUpAmount.toString())
                ],
              ),
              Divider(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('TRANSACTION DATE'.tr),
                  Text(TimeFormat().formatDate(DateTime.now()))
                ],
              ),
              Divider(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.gotoWallet();
                  },
                  child: Text('Go Home'.tr))
            ],
          ),
        ));
  }
}
