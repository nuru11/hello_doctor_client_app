import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/collection/prescription_collection.dart';
import 'package:hallo_doctor_client/app/collection/user_wallet_collection.dart';
import 'package:hallo_doctor_client/app/collection/user_wallet_history_collection.dart';
import 'package:hallo_doctor_client/app/models/doctor_model.dart';
import 'package:hallo_doctor_client/app/models/prescription_model.dart';
import 'package:hallo_doctor_client/app/models/user_model.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_history_model.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_model.dart';

///Firebase collection class to make it easy accessing the firebase collection, if you wanto add new collection
///Just add collection name, and create CollectionReference base on the class model, and initialize it in FirebaseCollection._internal function
///Make sure you follow the template
class FirebaseCollection {
  /// User Collection base on firebase collection name
  static const String userCollectionName = "Users";
  static const String doctorCollectionName = "Doctors";

  static final FirebaseCollection _singleton = FirebaseCollection._internal();
  static final Map<Type, CollectionReference<dynamic>> _collectionCache = {};
  late CollectionReference<UserModel> userCol;
  late CollectionReference<Doctor> doctorCol;
  late CollectionReference<PrescriptionModel> prescriptionCol;
  late CollectionReference<UserWalletModel> userWalletCol;
  late CollectionReference<UserWalletHistoryModel> userWalletHistoryCol;
  factory FirebaseCollection() {
    return _singleton;
  }

  FirebaseCollection._internal() {
    userCol = getOrCreateCollection<UserModel>(
        collectionName: userCollectionName,
        fromJson: UserModel.fromFirestore,
        toJson: (UserModel model) => model.toJson());
    doctorCol = getOrCreateCollection<Doctor>(
        collectionName: doctorCollectionName,
        fromJson: Doctor.fromFirestore,
        toJson: (Doctor model) => model.toJson());
    prescriptionCol = PrescriptionCollection.create().collectionRef;
    userWalletCol = UserWalletCollection.create().collectionRef;
    userWalletHistoryCol = UserWalletHistoryCollection.create().collectionRef;
  }
  static CollectionReference<T> getOrCreateCollection<T>(
      {required String collectionName,
      required T Function(DocumentSnapshot doc) fromJson,
      required Map<String, dynamic> Function(T model) toJson}) {
    final type = T;
    if (_collectionCache.containsKey(type)) {
      return _collectionCache[type] as CollectionReference<T>;
    }
    final collection =
        FirebaseFirestore.instance.collection(collectionName).withConverter<T>(
              fromFirestore: (snapshot, _) => fromJson(snapshot),
              toFirestore: (value, _) => toJson(value),
            );
    _collectionCache[type] = collection;
    return collection;
  }
}
