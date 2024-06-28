import 'package:get/get.dart';

import '../controllers/list_prescription_controller.dart';

class ListPrescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPrescriptionController>(
      () => ListPrescriptionController(),
    );
  }
}
