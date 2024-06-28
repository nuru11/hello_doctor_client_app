import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/detail_doctor/controllers/detail_doctor_controller.dart';
import 'package:hallo_doctor_client/app/service/chat_service.dart';
import 'package:hallo_doctor_client/app/service/videocall_service.dart';

import '../controllers/appointment_detail_controller.dart';

class AppointmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppointmentDetailController>(
      () => AppointmentDetailController(),
    );
    Get.lazyPut<VideoCallService>(
      () => VideoCallService(),
    );
    Get.lazyPut<DetailDoctorController>(
      () => DetailDoctorController(),
    );
    Get.lazyPut<ChatService>(
      () => ChatService(),
    );
  }
}
