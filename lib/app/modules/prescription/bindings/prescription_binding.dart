import 'package:get/get.dart';

import '../controllers/prescription_controller.dart';

class PrescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrescriptionController>(
      () => PrescriptionController(),
    );
  }
}
