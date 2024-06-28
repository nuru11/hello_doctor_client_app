import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/widgets/submit_button.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';

import '../controllers/topup_wallet_controller.dart';

class TopupWalletView extends GetView<TopupWalletController> {
  const TopupWalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up Wallet'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'amount',
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    prefixText: currencySign,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.min(controller.minimumTopUpAmount),
                    FormBuilderValidators.max(controller.maximumTopUpAmount),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown(
                  name: 'payment_method',
                  isExpanded: true,
                  decoration: InputDecoration(
                      hintText: 'Payment Method',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                          ))),
                  items: [
                    "Stripe",
                  ].map((option) {
                    return DropdownMenuItem(
                      child: Text("$option"),
                      value: option,
                    );
                  }).toList(),
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(
                  height: 20,
                ),
                SubmitButton(
                    onTap: () {
                      controller.topUpWallet();
                    },
                    text: 'Top Up')
              ],
            )),
      ),
    );
  }
}
