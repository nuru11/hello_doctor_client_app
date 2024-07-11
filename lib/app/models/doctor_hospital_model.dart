// class DoctorCategory {
//   String? categoryId;
//   String? categoryName;
//   String? iconUrl;
//   DoctorCategory({this.categoryId, this.categoryName, this.iconUrl});

//   static const String _categoryName = 'categoryName';
//   static const String _iconUrl = 'iconUrl';
//   static const String _categoryId = 'categoryId';

//   factory DoctorCategory.fromJson(Map<String, dynamic> data) {
//     return DoctorCategory(
//       categoryId: data[_categoryId],
//       categoryName: data[_categoryName],
//       iconUrl: data[_iconUrl],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_hospital_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class HDoctorCategory {
  String? id;
  @JsonKey(name: 'hcategoryId')
  String? categoryId;
  @JsonKey(name: 'categoryName')
  String? categoryName;
  @JsonKey(name: 'iconUrl')
  String? iconUrl;
  HDoctorCategory({this.id, this.categoryId, this.categoryName, this.iconUrl});
  factory HDoctorCategory.fromJson(Map<String, dynamic> json) =>
      _$HDoctorCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$HDoctorCategoryToJson(this);
  factory HDoctorCategory.fromFirestore(DocumentSnapshot doc) =>
      HDoctorCategory.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;
}
