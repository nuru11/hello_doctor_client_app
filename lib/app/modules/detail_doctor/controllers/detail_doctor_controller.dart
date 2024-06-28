import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_ui/flutter_chat_ui_types.dart' as types;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/models/review_model.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/chat_service.dart';
import 'package:hallo_doctor_client/app/service/doctor_service.dart';
import 'package:hallo_doctor_client/app/service/review_service.dart';

class DetailDoctorController extends GetxController with StateMixin<Doctor> {
  final count = 0.obs;
  Doctor selectedDoctor = Get.arguments;
  List<ReviewModel> listReview = [];
  late ChatService chatService;

  @override
  void onInit() {
    super.onInit();
    chatService = Get.find();
    ReviewService().getDoctorReview(doctor: selectedDoctor).then((value) {
      listReview = value;
      change(selectedDoctor, status: RxStatus.success());
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void toChatDoctor(Doctor doctorToChat) async {
    try {
      var room = await chatService.createChatRoom(doctorToChat);
      Get.toNamed(Routes.CHAT, arguments: [room, doctorToChat]);
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
