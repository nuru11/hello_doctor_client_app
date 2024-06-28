import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/models/order_model.dart' as orderModel;
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/modules/detail_doctor/controllers/detail_doctor_controller.dart';
import 'package:hallo_doctor_client/app/routes/app_pages.dart';
import 'package:hallo_doctor_client/app/service/chat_service.dart';
import 'package:hallo_doctor_client/app/service/doctor_service.dart';
import 'package:hallo_doctor_client/app/service/order_service.dart';
import 'package:hallo_doctor_client/app/service/videocall_service.dart';

class AppointmentDetailController extends GetxController
    with StateMixin<TimeSlot> {
  final count = 0.obs;
  VideoCallService videoCallService = Get.find();
  var videoCallStatus = false.obs;
  //ParseObject? room;
  TimeSlot selectedTimeslot = Get.arguments;
  late Doctor doctor;
  late orderModel.Order order;
  late String token;
  var database = FirebaseDatabase.instance.ref();
  late StreamSubscription _roomStreaming;
  var active = true.obs;
  late ChatService chatService;
  @override
  void onInit() async {
    super.onInit();
    chatService = Get.find();
    DoctorService().getDoctorDetail(selectedTimeslot.doctorid!).then(
      (doc) {
        selectedTimeslot.doctor = doc;
        doctor = doc;
        change(selectedTimeslot, status: RxStatus.success());
        if (selectedTimeslot.status == 'refund') {
          Get.defaultDialog(
              title: 'Appointment Canceled'.tr,
              content: Text(
                  'the doctor has canceled the appointment, and your payment has been refunded'
                      .tr),
              onConfirm: () {
                Get.back();
              });
        }
      },
    );
    var roomSnapshot = FirebaseFirestore.instance
        .collection('RoomVideoCall')
        .doc(selectedTimeslot.timeSlotId!)
        .snapshots();

    _roomStreaming = roomSnapshot.listen((event) async {
      if (event.data() == null) {
        videoCallStatus.value = false;
      } else {
        await Future.delayed(const Duration(seconds: 3), () {
          videoCallStatus.value = true;
          token = event.data()!['token'];
        });
      }
    });
  }

  @override
  void onClose() {
    _roomStreaming.cancel();
  }

  void startVideoCall() {
    if (videoCallStatus.value) {
      videoCallStatus.value = false;
      Get.toNamed(Routes.VIDEO_CALL, arguments: [
        {
          'timeSlot': selectedTimeslot,
          'room': selectedTimeslot.timeSlotId,
          'token': token
        }
      ]);
    } else {
      if (selectedTimeslot.status == 'refund') {
        Fluttertoast.showToast(
            msg:
                'the doctor has canceled the appointment, and your payment has been refunded'
                    .tr,
            toastLength: Toast.LENGTH_LONG);
      } else {
        Fluttertoast.showToast(
            msg:
                'the doctor has not started the meeting session, this button will automatically turn on when the doctor has started it'
                    .tr,
            toastLength: Toast.LENGTH_LONG);
      }
    }
  }

  toConsultationConfirm() {
    Get.toNamed(Routes.CONSULTATION_CONFIRM, arguments: selectedTimeslot);
  }

  Future getOrder() async {
    try {
      order = await OrderService().getSuccessOrder(selectedTimeslot);
    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    }
  }

  void rescheduleAppointment() {
    Get.toNamed(Routes.CONSULTATION_DATE_PICKER,
        arguments: [selectedTimeslot.doctor, selectedTimeslot]);
  }

  void gotoListPrescription() {
    Get.toNamed(Routes.PRESCRIPTION, arguments: selectedTimeslot);
  }

  void gotoChatDoctor() async {
    try {
      if (selectedTimeslot.doctor == null) {
        Fluttertoast.showToast(msg: 'No doctor found'.tr);
      }
      selectedTimeslot.doctor?.doctorId = selectedTimeslot.doctor?.id;
      var room = await chatService.createChatRoom(selectedTimeslot.doctor!);
      Get.toNamed(Routes.CHAT, arguments: [room, selectedTimeslot.doctor]);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
