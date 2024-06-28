import 'doctor_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Doctor {
  Doctor(
      {this.id,
      this.doctorId,
      this.doctorName,
      this.doctorPicture,
      this.doctorPrice,
      this.doctorShortBiography,
      this.doctorCategory,
      this.doctorHospital,
      this.accountStatus});
  String? id;
  @JsonKey(name: 'doctorId')
  String? doctorId;
  @JsonKey(name: 'doctorName')
  String? doctorName;
  @JsonKey(name: 'doctorPicture')
  String? doctorPicture;
  @JsonKey(name: 'doctorBasePrice')
  int? doctorPrice;
  @JsonKey(name: 'doctorBiography')
  String? doctorShortBiography;
  @JsonKey(name: 'doctorCategory', toJson: doctorcategoryToJson)
  DoctorCategory? doctorCategory;
  @JsonKey(name: 'doctorHospital')
  String? doctorHospital;
  @JsonKey(name: 'accountStatus')
  String? accountStatus;
  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
  factory Doctor.fromFirestore(DocumentSnapshot doc) =>
      Doctor.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;
  static Map<String, dynamic>? doctorcategoryToJson(
          DoctorCategory? doctorcategory) =>
      doctorcategory?.toJson();
}
