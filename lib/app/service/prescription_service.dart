import 'package:hallo_doctor_client/app/collection/firebase_collection.dart';
import 'package:hallo_doctor_client/app/models/prescription_model.dart';

class PrescriptionService {
  Future<List<PrescriptionModel>> getTimeSlotPrescription(
      String timeSlotId) async {
    try {
      var timeSlotData = await FirebaseCollection()
          .prescriptionCol
          .where('timeSlotId', isEqualTo: timeSlotId)
          .get();
      if (timeSlotData.docs.isEmpty) {
        return [];
      }
      return timeSlotData.docs.map((e) => e.data()).toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
