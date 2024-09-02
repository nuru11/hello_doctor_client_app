// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HDoctorCategory _$HDoctorCategoryFromJson(Map<String, dynamic> json) =>
    HDoctorCategory(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$HDoctorCategoryToJson(HDoctorCategory instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'iconUrl': instance.iconUrl,
    };
