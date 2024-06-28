import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/helpers/timestamp_converter.dart';
part 'user_wallet_model.g.dart';
part 'user_wallet_model.freezed.dart';

@freezed
class UserWalletModel with _$UserWalletModel {
  const factory UserWalletModel({
    String? id,
    int? balance,
    String? userId,
    String? username,
    String? currency,
    @TimestampConverter() DateTime? createdAt,
  }) = _UserWalletModel;

  factory UserWalletModel.fromJson(Map<String, dynamic> json) =>
      _$UserWalletModelFromJson(json);

  factory UserWalletModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return UserWalletModel.fromJson(data);
  }
}
