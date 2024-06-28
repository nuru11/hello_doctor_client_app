import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/collection/firebase_collection.dart';
import 'package:hallo_doctor_client/app/models/user_model.dart';
import 'package:path/path.dart';

import 'auth_service.dart';

class UserService {
  static const String userCollectionName = 'Users';

  ///user firebase, you cannot add another property to this user, use userModel to add another property
  ///other property to use, such age, gender, etc,
  ///this user belong to firebase, and only few property like email, password, uid
  static User? _userFirebase;

  ///this user representing userdata in firestore database, you can modify this user, base on your need
  ///such adding more property like age, gender, nationality, etc
  static UserModel? userModel;

  /// set new user data
  set user(UserModel userModel) => UserService.userModel = userModel;

  /// get current user data
  UserModel get user {
    if (UserService.userModel == null) {
      throw Exception('User is null');
    } else {
      return UserService.userModel!;
    }
  }

  set currentUserFirebase(User? user) => UserService._userFirebase = user;
  User? get currentUserFirebase {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      return auth.currentUser;
    } else {
      print('User Null');
      return null;
    }
  }

  Future<String> getUsername() async {
    return currentUserFirebase!.displayName!;
  }

  String? getProfilePicture() {
    String? profilePic;
    try {
      profilePic = currentUserFirebase?.photoURL ?? "";
    } catch (e) {
      profilePic = '';
    }
    return profilePic;
  }

  //Upload image file to firebase storage & update current user profile pic
  Future<String> updateProfilePic(File filePath) async {
    try {
      String fileName = basename(filePath.path);
      var ref = FirebaseStorage.instance.ref().child('uploads/$fileName');
      final result = await ref.putFile(File(filePath.path));
      final fileUrl = await result.ref.getDownloadURL();
      await updateProfileUrl(fileUrl);
      return fileUrl;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //Update current user profile url
  Future updateProfileUrl(String url) async {
    try {
      currentUserFirebase!.updatePhotoURL(url);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUserFirebase!.uid)
          .update({'photoUrl': url});
      user.photoUrl = url;
    } catch (err) {
      Future.error(err.toString());
    }
  }

  Future updateEmail(String email) async {
    try {
      currentUserFirebase!.updateEmail(email);
    } on FirebaseAuthException catch (err) {
      return Future.error(err.message!);
    }
  }

  Future changePassword(String currentPassword, String newPassword) async {
    try {
      bool validatePassword =
          await AuthService().verifyPassword(currentPassword);
      if (validatePassword) {
        currentUserFirebase!.updatePassword(newPassword);
      }
    } catch (err) {
      return Future.error(err.toString());
    }
  }

  String getUserId() {
    return currentUserFirebase!.uid;
  }

  Future<UserModel?> getUserModel() async {
    try {
      if (currentUserFirebase == null) {
        throw Exception('user is null');
      }
      var user = await FirebaseCollection()
          .userCol
          .doc(currentUserFirebase!.uid)
          .get();
      if (!user.exists) {
        printError(
            info:
                'User data from firestore not found, could be deleted or not saved yet');
        return null;
      }
      this.user = user.data()!;
      printInfo(info: 'User id : ${this.user.userId}');
      return user.data();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<UserModel?> getUserModelById(String uid) async {
    try {
      if (currentUserFirebase == null) {
        throw Exception('user is null');
      }
      var user = await FirebaseCollection().userCol.doc(uid).get();
      if (!user.exists) {
        printError(
            info:
                'User data from firestore not found, could be deleted or not saved yet');
        return null;
      }
      this.user = user.data()!;
      printInfo(info: 'User id : ${this.user.userId}');
      return user.data();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future updateUserToken(String? token) async {
    try {
      List<String> newListToken;
      if (token == null) return printError(info: 'firebase token is null');
      if (user.token == null) {
        newListToken = [token];
        await _updateTokenFirebase(newListToken);
        return;
      } else {
        newListToken = [...?user.token, token];
        if (user.token!.contains(token)) {
          return printInfo(
              info: 'this token already exist, not update the token');
        } else {
          await _updateTokenFirebase(newListToken);
          return;
        }
      }
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<bool> checkIfUserExist() async {
    var userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUserFirebase!.uid)
        .get();
    if (userSnapshot.exists) return true;
    return false;
  }

  Future deleteAccountPermanently() async {
    try {
      var callable = FirebaseFunctions.instance.httpsCallable('deleteUser');
      await callable({'userId': currentUserFirebase!.uid});
    } catch (e) {
      return Future.error(e);
    }
  }

  Future _updateTokenFirebase(List<String> listToken) async {
    try {
      await FirebaseCollection()
          .userCol
          .doc(currentUserFirebase!.uid)
          .update({'token': FieldValue.arrayUnion(listToken)});
      user.token = listToken;
    } catch (e) {
      throw Future.error(e.toString());
    }
  }

  ///Delete specific notification token from this user, in database
  Future removeUserToken(String token) async {
    try {
      await FirebaseCollection().userCol.doc(currentUserFirebase!.uid).update({
        'token': FieldValue.arrayRemove([token])
      });
    } catch (e) {
      return Future.error(e);
    }
  }
}
