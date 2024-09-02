import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/prescription_model.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/service/prescription_service.dart';

class PrescriptionController extends GetxController
    with StateMixin<List<PrescriptionModel>> {
  //TODO: Implement PrescriptionController

  final count = 0.obs;
  late TimeSlot selectedTimeslot = Get.arguments;
  List<PrescriptionModel> listPrescription = [];
  @override
  void onInit() async {
    super.onInit();
    if (selectedTimeslot.timeSlotId == null) {
      change([],
          status: RxStatus.error('Error the time slot id is not provided'));
    } else {
      listPrescription = await PrescriptionService()
          .getTimeSlotPrescription(selectedTimeslot.timeSlotId!);
      if (listPrescription.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(listPrescription, status: RxStatus.success());
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
