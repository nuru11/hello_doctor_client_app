import 'package:get/get.dart';

import '../controllers/hlist_doctor_controller.dart';

class HListDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HListDoctorController>(
      () => HListDoctorController(),
    );
  }
}
