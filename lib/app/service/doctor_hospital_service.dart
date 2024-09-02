import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/models/doctor_hospital_model.dart';
// import 'package:hallo_doctor_client/app/models/doctor_category_model.dart';

class HDoctorCategoryService {
  FirebaseFirestore? _instance;

  final List<HDoctorCategory> _doctorCategory = [];

  List<HDoctorCategory> get getCategories => _doctorCategory;

  Future<List<HDoctorCategory>> getListDoctorCategory() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference doctorCategory =
        _instance!.collection('HDoctorCategory');

    QuerySnapshot snapshot = await doctorCategory.get();

    final allData = snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      data['categoryId'] = doc.reference.id;
      return data;
    });

    for (var category in allData) {
      HDoctorCategory doc = HDoctorCategory.fromJson(category);
      _doctorCategory.add(doc);
    }

    return _doctorCategory;
  }
}
