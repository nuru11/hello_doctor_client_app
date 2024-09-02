import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/models/order_detail_model.dart';
import 'package:hallo_doctor_client/app/models/paymob_model.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/local_notification_service.dart';
import 'package:hallo_doctor_client/app/service/notification_service.dart';
import 'package:hallo_doctor_client/app/service/payment_service.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:hallo_doctor_client/app/utils/constants/constants.dart';
import 'package:hallo_doctor_client/app/utils/environment.dart';
import 'package:intl/intl.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../models/user_wallet_model.dart';
import '../../../service/user_wallet_service.dart';
import '../../../service/payment_service.dart';

class DetailOrderController extends GetxController {
  final username = ''.obs;
  final UserService userService = Get.find();
  List<OrderDetailModel> orderDetail = List.empty();
  TimeSlot selectedTimeSlot = Get.arguments[0];
  Doctor doctor = Get.arguments[1];
  PaymentService paymentService = Get.find();
  NotificationService notificationService = Get.find<NotificationService>();
  late String clientSecret;
  // Razorpay _razorpay = Razorpay();
  late var options;
  var formKey = GlobalKey<FormBuilderState>();
  UserWalletModel? userWallet;
  List<String> paymentType = ["Stripe", "Wallet"];
  @override
  void onInit() async {
    super.onInit();
    String userId = UserService().getUserId();
    userWallet = await UserWalletService().getUserWallet(userId);
    update();
    userService.getUsername().then((value) {
      username.value = value;
    });
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onClose() {}

  OrderDetailModel buildOrderDetail() {
    var formatter = DateFormat('yyyy-MM-dd hh:mm');
    var time = formatter.format(selectedTimeSlot.timeSlot!);

    var orderDetail = OrderDetailModel(
        itemId: selectedTimeSlot.timeSlotId!,
        itemName: 'Consultation with ${doctor.doctorName!}',
        time: time,
        duration: '${selectedTimeSlot.duration} minute',
        price: currencySign + selectedTimeSlot.price.toString());
    return orderDetail;
  }

  // void payWithRazorpay() async {
  //   EasyLoading.show();
  //   try {
  //     var currentUser = FirebaseAuth.instance.currentUser;
  //     String orderId = await PaymentService().payWithRazorpay(
  //         selectedTimeSlot.timeSlotId!, userService.getUserId());
  //     print('order id : $orderId');
  //     print('price : ${selectedTimeSlot.price}');
  //     String username = await userService.getUsername();
  //     options = {
  //       'key': Environment.razorpayKeyId,
  //       'amount': selectedTimeSlot.price! * 100,
  //       'name': username,
  //       'notes': {'order_id': orderId},
  //       'description': 'Timeslot Consultation',
  //       'prefill': {'contact': '8888888888', 'email': currentUser?.email ?? ''}
  //     };

  //     _razorpay.open(options);
  //     //PaymentService().payWithRazorpay();
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   } finally {
  //     EasyLoading.dismiss();
  //   }
  // }

  /// by default the payment method we us is Stripe to change you need to change
  /// makePayment method and change the cloud function method
  void payWithStripe() async {
    EasyLoading.show();
    try {
      var clientSecret = await paymentService.getClientSecret(
          selectedTimeSlot.timeSlotId!, userService.getUserId());
      if (clientSecret.isEmpty) return;

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: appName,
        paymentIntentClientSecret: clientSecret,
      ));
      EasyLoading.dismiss();
      await Stripe.instance.presentPaymentSheet();

      Get.offNamed('/payment-success', arguments: selectedTimeSlot);
      await LocalNotificationService().setAppointmentNotification(
          doctor: doctor, timeSlot: selectedTimeSlot);
    } on StripeException catch (err) {
      Fluttertoast.showToast(msg: err.error.message!);
      return null;
    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
      return null;
    } finally {
      EasyLoading.dismiss();
    }
  }

  void showDialogStripeTesting() {
    Get.defaultDialog(
      title: 'Test Mode',
      content: Text(
          'This is a testing mode, to make a payment in test mode, please enter the number 42 consecutively in the credit card details, E.g. credit card: 424242424244242'),
      textConfirm: 'Make Payment With Stripe',
      onConfirm: () {
        Get.back();
        payWithStripe();
      },
    );
  }

  void purchaseFreeTimeslot() async {
//check the price if 0 call cloud function to check if this timeslot is actually 0
    //then return true, if false then throw error

    try {
      EasyLoading.show();
      bool result = await PaymentService().purchaseFreeTimeSlot(
          selectedTimeSlot.timeSlotId!, userService.getUserId());
      if (result) {
        Get.offNamed('/payment-success', arguments: selectedTimeSlot);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void makePayment() async {
    if (selectedTimeSlot.price! <= 0) {
      print('purchase free timeslot : ');
      purchaseFreeTimeslot();
    } else {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        var data = await Get.defaultDialog<bool>(
          
            title: 'Confirmation',
            middleText:
                'Are you sure you want to make payment with ${formKey.currentState!.value['payment_method']} for ${currencySign}${selectedTimeSlot.price}'
                    .tr,
            textCancel: 'Cancel',
            textConfirm: 'OK',
            onCancel: () {},
            onConfirm: () {
              Get.back(result: true);
            });
        if (data != null && data) {
          if (formKey.currentState!.value['payment_method'] == 'Stripe') {
            showDialogStripeTesting();
          } else if (formKey.currentState!.value['payment_method'] ==
              'Wallet') {
            payWithWallet();
          }
          // EasyLoading.show(status: 'Saving...');
          // await UserService().updateDisplayName(
          //     formKey.currentState!.value['edit_display_name']);
          // EasyLoading.dismiss();
          // Get.back();
        }
      }

      //

      ///if you wanto enable paymob payment gateway uncomment line bellow, and remove line payWithStripe();
      // payWithPaymob();

      ///if you wanto enable razopay payment gateway uncomment line bellow, and remove line payWithStripe();
      // payWithRazorpay();
    }
  }

  void payWithPaymob() async {
    try {
      PaymobPaymentType? paymentType =
          await Get.defaultDialog<PaymobPaymentType>(
        title: 'Choose Payment type',
        content: Container(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    return Get.back(result: PaymobPaymentType.card);
                  },
                  child: Text('Pay With Card')),
              TextButton(
                  onPressed: () {
                    return Get.back(result: PaymobPaymentType.kiosk);
                  },
                  child: Text('Pay With Kiosk'))
            ],
          ),
        ),
        onCancel: () {
          Get.back();
        },
      );
      if (paymentType == null) {
        return;
      }
      Get.back();
      EasyLoading.show();
      PaymobModelResponse paymobData = await PaymentService().payWithPaymob(
          selectedTimeSlot.timeSlotId!, userService.getUserId(), paymentType);
      if (paymentType == PaymobPaymentType.card) {
        Get.toNamed(Routes.PAYMOB_CARD_PAYMENT,
            arguments: [paymobData.token, selectedTimeSlot]);
      } else {
        Get.toNamed(Routes.PAYMOB_KIOSK_PAYMENT, arguments: [
          paymobData.token,
          paymobData.kioskCode,
          selectedTimeSlot
        ]);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  // _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   Get.offNamed(Routes.PAYMENT_SUCCESS, arguments: selectedTimeSlot);
  //   //selectedTimeSlot.timeSlot
  //   notificationService.setNotificationAppointment(selectedTimeSlot.timeSlot!);
  // }

  // _handlePaymentError(PaymentFailureResponse response) {
  //   Fluttertoast.showToast(
  //       msg: response.message.toString(), toastLength: Toast.LENGTH_LONG);
  // }

  // _handleExternalWallet(ExternalWalletResponse response) {
  //   Fluttertoast.showToast(
  //       msg: "EXTERNAL_WALLET: ${response.walletName!}",
  //       toastLength: Toast.LENGTH_SHORT);
  // }

  void payWithWallet() async {
    try {
      EasyLoading.show();
      if (userWallet == null) {
        Fluttertoast.showToast(
            msg: 'Wallet is empty, please top up in Wallet section');
        return;
      }
      if (userWallet!.balance! <= 0) {
        Fluttertoast.showToast(
            msg: 'Your wallet is empty, please top up in Wallet section');
        return;
      }
      if (userWallet!.balance! < selectedTimeSlot.price!) {
        Fluttertoast.showToast(msg: 'Your wallet balance is not enough');
        return;
      }
      String userId = UserService().getUserId();
      if (selectedTimeSlot.timeSlotId == null) {
        throw Exception('time slot id is null');
      }
      await PaymentService().purchaseTimeSlotWithWallet(
          userId: userId, timeSlotId: selectedTimeSlot.timeSlotId!);
      Get.offNamed(Routes.PAYMENT_SUCCESS, arguments: selectedTimeSlot);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
