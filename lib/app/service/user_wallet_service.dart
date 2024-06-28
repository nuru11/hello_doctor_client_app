import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/models/user_wallet_history_model.dart';

import '../collection/firebase_collection.dart';
import '../models/user_wallet_model.dart';

class UserWalletService extends GetxService {
  Future<UserWalletService> init() async {
    return this;
  }

  Future<UserWalletModel?> getUserWallet(String userId) async {
    try {
      var userWalletRef =
          await FirebaseCollection().userWalletCol.doc(userId).get();
      if (userWalletRef.exists) {
        return userWalletRef.data();
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      return Future.error(e.message ?? e.toString());
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<UserWalletHistoryModel>> getUserWalletHistory(
      String userId) async {
    try {
      var listUserWalletRef = await FirebaseCollection()
          .userWalletCol
          .doc(userId)
          .collection('History')
          .get();
      List<UserWalletHistoryModel> listUserWallet = listUserWalletRef.docs
          .map((e) => UserWalletHistoryModel.fromFirestore(e))
          .toList();

      return listUserWallet;
    } on FirebaseException catch (e) {
      return Future.error(e.message ?? e.toString());
    } catch (e) {
      return Future.error(e);
    }
  }
}
