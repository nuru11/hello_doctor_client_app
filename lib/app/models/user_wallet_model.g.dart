// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWalletModelImpl _$$UserWalletModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserWalletModelImpl(
      id: json['id'] as String?,
      balance: json['balance'] as int?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      currency: json['currency'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UserWalletModelImplToJson(
        _$UserWalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'userId': instance.userId,
      'username': instance.username,
      'currency': instance.currency,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
