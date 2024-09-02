import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/widgets/submit_button.dart';

import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Account'.tr),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Are you sure you wanto delete your account? Please read how account deletion will affect'
                  .tr,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Account '.tr + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Deleting your account remove personal information from our database. Your email become personally reserverd and same email cannot be re-used to register new account.'
                                .tr +
                            '\n',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                      text: 'Email'.tr + '\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'Deleting your account will unsubscribe you from all mailing list'
                              .tr)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Confirm Account Deletion'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Enter PERMANENTLY DELETE to confirm'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.textPermanentDeleteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SubmitButton(
                onTap: () {
                  controller.deleteAccount();
                },
                text: 'Delete my Account'.tr),
          ],
        ),
      ),
    );
  }
}
