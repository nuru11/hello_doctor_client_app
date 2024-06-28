import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/collection/firebase_collection.dart';
import 'package:hallo_doctor_client/app/models/user_model.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';

class FirebaseService {
  Future<bool> checkUserAlreadyLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      printInfo(info: 'User Uid : ${auth.currentUser!.uid}');
      return true;
    } else {
      printInfo(info: 'User not login yet');
      return false;
    }
  }

  Future userSetup(User user, String displayName) async {
    String uid = user.uid.toString();
    UserModel newUser = UserModel(
        email: user.email,
        displayName: displayName,
        photoUrl: user.photoURL,
        lastLogin: user.metadata.lastSignInTime,
        createdAt: user.metadata.creationTime,
        role: 'user');
    await FirebaseCollection().userCol.doc(uid).set(newUser);
  }
}
