import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/service/review_service.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';

class ReviewController extends GetxController {
  //TODO: Implement ReviewController

  var review = '';
  var rating = 5.0.obs;
  TextEditingController textEditingReviewController = TextEditingController();
  TimeSlot timeSlot = Get.arguments;
  var price = 0.obs;

  @override
  void onInit() {
    super.onInit();
    price.value = timeSlot.price!;
  }

  @override
  void onClose() {}
  void saveReiew() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    var user = UserService().currentUserFirebase;
    try {
      await ReviewService().saveReview(textEditingReviewController.text,
          rating.value.toInt(), timeSlot, user!);
      Get.close(2);
      //Get.back();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
