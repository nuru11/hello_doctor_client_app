import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/models/prescription_model.dart';
import './firebase_collection.dart';

class PrescriptionCollection {
  static const String collectionName = "Prescription";
  CollectionReference<PrescriptionModel> collectionRef;
  PrescriptionCollection._(this.collectionRef);

  static PrescriptionCollection create() {
    final CollectionReference<PrescriptionModel> collection =
        FirebaseCollection.getOrCreateCollection<PrescriptionModel>(
      collectionName: collectionName,
      fromJson: PrescriptionModel.fromFirestore,
      toJson: (PrescriptionModel model) => model.toJson(),
    );
    return PrescriptionCollection._(collection);
  }
}
