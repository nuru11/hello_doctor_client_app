import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_model.dart';
import './firebase_collection.dart';

class UserWalletCollection {
  static const String collectionName = "UserWallet";
  CollectionReference<UserWalletModel> collectionRef;
  UserWalletCollection._(this.collectionRef);

  static UserWalletCollection create() {
    final CollectionReference<UserWalletModel> collection =
        FirebaseCollection.getOrCreateCollection<UserWalletModel>(
      collectionName: collectionName,
      fromJson: UserWalletModel.fromFirestore,
      toJson: (UserWalletModel model) => model.toJson(),
    );
    return UserWalletCollection._(collection);
  }
}
