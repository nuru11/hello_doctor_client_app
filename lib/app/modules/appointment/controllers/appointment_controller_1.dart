import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/service/timeslot_service.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';

class AppointmentController extends GetxController
    with StateMixin<List<TimeSlot>> {
  final count = 0.obs;
  final TimeSlotService _appointmentService = Get.find();
  UserService userService = Get.find();
  List<TimeSlot> listOrderedTimeslot = [];
  var sortByIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getListAppointment();
  }

  @override
  void onClose() {}

  Future<void> getListAppointment() async {
    try {
      listOrderedTimeslot = await _appointmentService
          .getListAppointment(userService.currentUserFirebase!);
      if (listOrderedTimeslot.isEmpty) {
        return change([], status: RxStatus.empty());
      }
      change(listOrderedTimeslot, status: RxStatus.success());
    } catch (err) {
      change([], status: RxStatus.error(err.toString()));
    }
  }

  void filterSortBy(int index) {
    sortByIndex.value = index;
    if (index == 0) {
      sortListByTimeSlot();
    } else if (index == 1) {
      sortListByPurchaseDate();
    }
    change(listOrderedTimeslot, status: RxStatus.success());
  }

  void sortListByPurchaseDate() {
    listOrderedTimeslot.sort((a, b) {
      if (a.purchaseTime == null && b.purchaseTime == null) {
        return 0;
      } else if (a.purchaseTime == null) {
        return -1;
      } else if (b.purchaseTime == null) {
        return 1;
      } else {
        return b.purchaseTime!.compareTo(a.purchaseTime!);
      }
    });
  }

  void sortListByTimeSlot() {
    listOrderedTimeslot.sort((a, b) {
      if (a.timeSlot == null && b.timeSlot == null) {
        return 0;
      } else if (a.timeSlot == null) {
        return -1;
      } else if (b.timeSlot == null) {
        return 1;
      } else {
        return b.timeSlot!.compareTo(a.timeSlot!);
      }
    });
  }
}
