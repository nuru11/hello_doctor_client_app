import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hallo_doctor_client/app/utils/helpers/timestamp_converter.dart';
part 'prescription_model.g.dart';
part 'prescription_model.freezed.dart';

@freezed
class PrescriptionModel with _$PrescriptionModel {
  const factory PrescriptionModel(
      {String? id,
      String? timeSlotId,
      String? doctorId,
      String? userId,
      @TimestampConverter() DateTime? createdAt,
      String? prescription}) = _PrescriptionModel;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionModelFromJson(json);

  factory PrescriptionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return PrescriptionModel.fromJson(data);
  }
}
