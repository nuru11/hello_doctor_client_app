import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import '../models/user_wallet_history_model.dart';
import './firebase_collection.dart';

class UserWalletHistoryCollection {
  static const String collectionName = "History";
  static String userId = '';
  CollectionReference<UserWalletHistoryModel> collectionRef;
  UserWalletHistoryCollection._(this.collectionRef);

  static UserWalletHistoryCollection create() {
    final CollectionReference<UserWalletHistoryModel> collection =
        FirebaseCollection.getOrCreateCollection<UserWalletHistoryModel>(
      collectionName: collectionName,
      fromJson: UserWalletHistoryModel.fromFirestore,
      toJson: (UserWalletHistoryModel model) => model.toJson(),
    );
    return UserWalletHistoryCollection._(collection);
  }
}
