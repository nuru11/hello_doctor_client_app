import 'package:cloud_firestore/cloud_firestore.dart';

import 'doctor_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'time_slot_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class TimeSlot {
  TimeSlot(
      {this.timeSlotId,
      this.timeSlot,
      this.duration,
      this.price,
      this.available,
      this.doctorid,
      this.doctor,
      this.purchaseTime,
      this.status});
  String? id;
  @JsonKey(name: 'timeSlotId')
  String? timeSlotId;
  @JsonKey(
      name: 'timeSlot', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? timeSlot;
  @JsonKey(name: 'duration')
  int? duration;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'available')
  bool? available;
  @JsonKey(name: 'doctorId')
  String? doctorid;
  @JsonKey(name: 'doctor', toJson: doctorToJson)
  Doctor? doctor;
  @JsonKey(
      name: 'purchaseTime',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson)
  DateTime? purchaseTime;
  @JsonKey(name: 'status')
  String? status;
  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotToJson(this);
  factory TimeSlot.fromFirestore(DocumentSnapshot doc) =>
      TimeSlot.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;
  static Map<String, dynamic>? doctorToJson(Doctor? doctor) => doctor?.toJson();
  static DateTime? _dateTimeFromJson(Timestamp? timestamp) =>
      timestamp?.toDate();
  static Timestamp _dateTimeToJson(DateTime? dateTime) =>
      Timestamp.fromDate(dateTime!);
}
