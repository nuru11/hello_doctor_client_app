// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wallet_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserwallethistoryModelImpl _$$UserwallethistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserwallethistoryModelImpl(
      id: json['id'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      initialAmount: json['initialAmount'] as int?,
      finalAmount: json['finalAmount'] as int?,
      transactionAmount: json['transactionAmount'] as int?,
      userId: json['userId'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$UserwallethistoryModelImplToJson(
        _$UserwallethistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'initialAmount': instance.initialAmount,
      'finalAmount': instance.finalAmount,
      'transactionAmount': instance.transactionAmount,
      'userId': instance.userId,
      'status': instance.status,
      'description': instance.description,
      'type': instance.type,
    };
