import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/collection/firebase_collection.dart';
import 'package:hallo_doctor_client/app/models/doctor_category_model.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';

class DoctorService {
  //Get list of Doctor schedule base on doctor id
  Future<List<TimeSlot>> getDoctorTimeSlot(Doctor doctor) async {
    try {
      //List<TimeSlot> listTimeslot = [];
      QuerySnapshot doctorScheduleRef = await FirebaseFirestore.instance
          .collection('DoctorTimeslot')
          .where('doctorId', isEqualTo: doctor.doctorId)
          .get();

      var listTimeslot = doctorScheduleRef.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['timeSlotId'] = doc.reference.id;
        TimeSlot timeSlot = TimeSlot.fromJson(data);

        return timeSlot;
      }).toList();
      if (doctorScheduleRef.docs.isEmpty) return [];
      return listTimeslot;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

// Get doctor and all its property
  Future<Doctor> getDoctorDetail(String doctorId) async {
    // var doctorSnapshot = await FirebaseFirestore.instance
    //     .collection('Doctors')
    //     .doc(doctorId)
    //     .get();
    // Doctor doctor =
    //     Doctor.fromJson(doctorSnapshot.data() as Map<String, dynamic>);
    // doctor.doctorId = doctorId;
    var doctor = await FirebaseCollection().doctorCol.doc(doctorId).get();
    if (doctor.exists) {
      return doctor.data()!;
    } else {
      throw Exception('Doctor data is not found');
    }
  }

  Future<List<Doctor>> getListDoctorByCategory(
      DoctorCategory doctorCategory) async {
    try {
      List<Doctor> listDoctor = [];
      var listDoctorQuery = await FirebaseFirestore.instance
          .collection('Doctors')
          .where('doctorCategory.categoryId',
              isEqualTo: doctorCategory.categoryId)
          .where('accountStatus', isEqualTo: 'active')
          .get();

      if (listDoctorQuery.docs.isEmpty) return [];
      var list = listDoctorQuery.docs.map((doc) {
        var data = doc.data();
        data['doctorId'] = doc.reference.id;
        Doctor doctor = Doctor.fromJson(data);
        listDoctor.add(doctor);
      }).toList();
      print('list doctor : ' + list.toString());
      return listDoctor;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Doctor>> getTopRatedDoctor({int limit = 10}) async {
    try {
      var doctorRef = await FirebaseFirestore.instance
          .collection('Doctors')
          .where('topRated', isEqualTo: true)
          .get();
      print('length : ' + doctorRef.docs.length.toString());
      List<Doctor> listTopRatedDoctor = doctorRef.docs.map((doc) {
        var data = doc.data();
        data['doctorId'] = doc.reference.id;
        Doctor doctor = Doctor.fromJson(data);
        return doctor;
      }).toList();
      return listTopRatedDoctor;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Doctor>> searchDoctor(String doctorName) async {
    try {
      print('doctor name : ' + doctorName);
      if (doctorName.isEmpty) return [];
      var doctorRef = await FirebaseFirestore.instance
          .collection('Doctors')
          .where('doctorName',
              isGreaterThanOrEqualTo: doctorName,
              isLessThan: doctorName.substring(0, doctorName.length - 1) +
                  String.fromCharCode(
                      doctorName.codeUnitAt(doctorName.length - 1) + 1))
          .get();
      List<Doctor> listDoctor = doctorRef.docs.map((doc) {
        var data = doc.data();
        data['doctorId'] = doc.reference.id;
        Doctor doctor = Doctor.fromJson(data);
        return doctor;
      }).toList();
      listDoctor.removeWhere((element) => element.accountStatus != 'active');
      print('data searchnya : ' + listDoctor.toString());
      return listDoctor;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> getUserId(Doctor doctor) async {
    try {
      var user = await FirebaseFirestore.instance
          .collection('Users')
          .where('doctorId', isEqualTo: doctor.doctorId)
          .get();
      print('doc element' + user.docs.length.toString());
      if (user.docs.isEmpty) return '';
      return user.docs.elementAt(0).id;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
