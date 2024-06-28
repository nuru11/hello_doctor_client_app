import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/service/doctor_service.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:flutter_chat_ui/flutter_chat_ui_types.dart' as types;
import '../models/doctor_model.dart';

class ChatService extends GetxService {
  Future<ChatService> init() async {
    return this;
  }

  Future<Doctor> getDoctorByUserId(String uid) async {
    try {
      var user = await UserService().getUserModelById(uid);
      var doctor = await DoctorService().getDoctorDetail(user!.doctorId!);
      return doctor;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///TODO need to make it more clean
  Future<types.Room?> getRoomById(String roomId) async {
    try {
      var roomRef = await FirebaseFirestore.instance
          .collection('Rooms')
          .doc(roomId)
          .get();
      var roomDataFirebase = roomRef.data();
      if (roomDataFirebase == null) return null;
      DateTime createdAt =
          (roomDataFirebase['createdAt'] as Timestamp).toDate();
      DateTime updatedAt =
          (roomDataFirebase['updatedAt'] as Timestamp).toDate();
      List<types.User> listUser = (roomDataFirebase['userIds'] as List<dynamic>)
          .map((e) => types.User(id: e))
          .toList();
      types.Room roomData = types.Room(
          id: roomId,
          type: types.RoomType.direct,
          users: listUser,
          createdAt: createdAt,
          updatedAt: updatedAt,
          name: roomDataFirebase['name'],
          imageUrl: roomDataFirebase['imageUrl']);

      return roomData;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future createChatRoom(Doctor doctorToChat) async {
    try {
      String doctorUserId = await DoctorService().getUserId(doctorToChat);
      if (doctorUserId.isEmpty) {
        return Future.error('Doctor no longger exist'.tr);
      }
      if (doctorToChat.doctorId == null) {
        return Future.error('doctor id is null');
      }
      final otherUser = types.User(
          id: doctorUserId,
          displayName: doctorToChat.doctorName,
          imageUrl: doctorToChat.doctorPicture);
      final room = await FirebaseChatCore.instance.createRoom(otherUser);
      return room;
    } catch (e) {
      return Future.error(e);
    }
  }
}
