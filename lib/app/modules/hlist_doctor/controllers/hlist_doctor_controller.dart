import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/doctor_hospital_model.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/service/doctor_service.dart';

class HListDoctorController extends GetxController
    with StateMixin<List<Doctor>> {
      
  HDoctorCategory hdoctorCategory = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("llllssmmmmmmmmmm");
    print('doctor category Name : ' + hdoctorCategory.categoryName!);
    print("kkkkkkkkkkkkk:  ;;;" + Get.arguments.toString());
    DoctorService().getHListDoctorByCategory(hdoctorCategory).then((value) {
      if (value.isEmpty) return change([], status: RxStatus.empty());
      print('doctor : ' + value.toString());
      change(value, status: RxStatus.success());
    }).catchError((err) {
      change([], status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
