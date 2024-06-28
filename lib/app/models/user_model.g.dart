// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      photoUrl: json['photoUrl'] as String?,
      doctorId: json['doctorId'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      createdAt: UserModel._dateTimeFromJson(json['createdAt']),
      lastLogin: UserModel._dateTimeFromJson(json['lastLogin']),
      role: json['role'] as String?,
      token: UserModel.tokenFromJson(json['token']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'doctorId': instance.doctorId,
      'displayName': instance.displayName,
      'email': instance.email,
      'lastLogin': UserModel._dateTimeToJson(instance.lastLogin),
      'createdAt': UserModel._dateTimeToJson(instance.createdAt),
      'role': instance.role,
      'token': UserModel.tokenToJson(instance.token),
    };
