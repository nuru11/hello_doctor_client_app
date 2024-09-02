import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hallo_doctor_client/app/models/order_detail_model.dart';
import 'package:hallo_doctor_client/app/modules/payment_steps/views/payment_steps.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';
import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';

import '../controllers/detail_order_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ChosePayment { addCard, creditCard }

class DetailOrderView extends GetView<DetailOrderController> {
  final String assetName = 'assets/icons/powered-by-stripe.svg';
  bool isInReleaseMode = bool.fromEnvironment("dart.vm.product");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Order'.tr),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi '.tr + controller.username.value,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: mTitleColor),
                    ),
                    Text(
                      'before making a payment, make sure the items below are correct'
                          .tr,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: mSubtitleColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          detailOrderTable(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 20,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 30),
                            child: Text(
                              'Total : '.tr +
                                  currencySign +
                                  controller.selectedTimeSlot.price.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: mTitleColor),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    GetBuilder<DetailOrderController>(
                      builder: (_) {
                        return FormBuilder(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Visibility(
  visible: false, // Replace 'someCondition' with the appropriate condition
  child: FormBuilderDropdown(
    name: 'payment_method',
    isExpanded: true,
    decoration: InputDecoration(
      hintText: 'Payment Method',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),
    initialValue: 'Wallet',
    items: controller.paymentType.map((option) {
      if (option == 'Wallet') {
        return DropdownMenuItem(
          child: Text('Wallet with Balance: $currencySign${controller.userWallet?.balance?.toString() ?? '0'}'),
          value: option,
        );
      }

      
      return DropdownMenuItem(
        child: Text(option),
        value: option,
      );
    }).toList(),
    validator: FormBuilderValidators.required(),
  ),
),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GetBuilder<DetailOrderController>(
                      builder: (_) {
                        return Container(
                            child: InkWell(
                          onTap: () {
                            // controller.makePayment();
                            _showEmailList(context);
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: secondaryColor,
                            ),
                            child: Text(
                              'Book Now'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget detailOrderTable() {
    final column = ['Item'.tr, 'Duration'.tr, 'Time'.tr, 'Price'.tr];
    final listOrderItem = [controller.buildOrderDetail()];
    return DataTable(
      columns: getColumn(column),
      rows: getRows(listOrderItem),
      columnSpacing: 5,
    );
  }

  List<DataColumn> getColumn(List<String> column) => column
      .map((e) => DataColumn(
              label: Container(
            child: Text(e),
          )))
      .toList();

  List<DataRow> getRows(List<OrderDetailModel> orderDetailItem) =>
      orderDetailItem.map((e) {
        final cells = [e.itemName, e.duration, e.time, e.price];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((e) => DataCell(Text(
            '$e',
            style: tableCellText,
          )))
      .toList();

  Widget bottomSheetPaymenMethod() {
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Choose Payment Method",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: mTitleColor),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text("CREDIT CARD"),
              trailing: Icon(Icons.add_circle, color: secondaryColor),
              onTap: () {
                controller.makePayment();
              },
            ),
            ListTile(
              title: Text("TEST PAYMENT"),
              trailing: Icon(Icons.credit_card, color: secondaryColor),
              onTap: () {
                //
              },
            ),
            SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              assetName,
              color: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }





   void _showEmailList(BuildContext context) {
  List<String> dummyNames = [
    'Commercial Bank of Ethiopia (CBE)',
    'Abay Bank',
    'Addis International Bank',
    '	Awash International Bank',
    'Bank of Abyssinia',
    'Berhan International Bank',
    'Bunna International Bank',
    'Cooperative Bank of Oromia',
    'Nib International Bank',
    'Amhara Bank',
  ];

  List<String> dummyImagePaths = [
    'assets/banks/cbe.jpeg',
    'assets/banks/abay.png',
    'assets/banks/addis.jpeg',
    'assets/banks/awash.jpeg',
    'assets/banks/abyssinia.png',
    'assets/banks/berhan.png',
    'assets/banks/bunna.png',
    'assets/banks/cooperative.png',
    'assets/banks/nib.jpeg',
    'assets/banks/amhara.png',
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Banks',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummyNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(dummyImagePaths[index]),
                    ),
                    title: Text(dummyNames[index]),
                    onTap: () {
                      // Perform email-related action here
                      Navigator.of(context).pop();
                      print(dummyImagePaths[index]);
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentStepsPage()));
            //           Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PaymentStepsPage(
            //       name: dummyNames[index],
            //       imagePath: dummyImagePaths[index],
            //     ),
            //   ),
            // );
            controller.makePayment();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
}
