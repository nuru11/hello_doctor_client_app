import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/doctor_hospital/controllers/doctor_category_controller.dart';

// import '../controllers/doctor_category_controller.dart';

class HDoctorCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HDoctorCategoryController>(
      () => HDoctorCategoryController(),
    );
  }
}
