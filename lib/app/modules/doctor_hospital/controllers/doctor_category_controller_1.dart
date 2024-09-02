import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_hospital_model.dart';
import 'package:hallo_doctor_client/app/service/doctor_hospital_service.dart';
// import 'package:hallo_doctor_client/app/models/doctor_category_model.dart';
// import 'package:hallo_doctor_client/app/service/doctor_category_service.dart';

class HDoctorCategoryController extends GetxController
    with StateMixin<List<HDoctorCategory>> {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    HDoctorCategoryService().getListDoctorCategory().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print('error : ' + err.toString());
      change([], status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
