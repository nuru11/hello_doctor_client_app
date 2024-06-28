import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/helpers/timestamp_converter.dart';
part 'user_wallet_history_model.g.dart';
part 'user_wallet_history_model.freezed.dart';

@freezed
class UserWalletHistoryModel with _$UserWalletHistoryModel {
  const factory UserWalletHistoryModel({
    String? id,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    int? initialAmount,
    int? finalAmount,
    int? transactionAmount,
    String? userId,
    String? status,
    String? description,
    String? type,
  }) = _UserwallethistoryModel;

  factory UserWalletHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$UserWalletHistoryModelFromJson(json);

  factory UserWalletHistoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return UserWalletHistoryModel.fromJson(data);
  }
}
