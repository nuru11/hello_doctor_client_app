import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class UserModel {
  String? userId;
  @JsonKey(name: 'photoUrl')
  String? photoUrl;
  @JsonKey(name: 'doctorId')
  String? doctorId;
  @JsonKey(name: 'displayName')
  String? displayName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(
      name: 'lastLogin', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? lastLogin;
  @JsonKey(
      name: 'createdAt', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? createdAt;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'token', fromJson: tokenFromJson, toJson: tokenToJson)
  List<String>? token;

  UserModel(
      {this.userId,
      this.photoUrl,
      this.doctorId,
      this.displayName,
      this.email,
      this.createdAt,
      this.lastLogin,
      this.role,
      this.token});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromFirestore(DocumentSnapshot doc) =>
      UserModel.fromJson(doc.data()! as Map<String, dynamic>)..userId = doc.id;

  static DateTime? _dateTimeFromJson(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return (timestamp).toDate();
    } else if (timestamp is int) {
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      return date;
    } else {
      return null;
    }
  }

  static Timestamp? _dateTimeToJson(DateTime? dateTime) {
    if (dateTime == null) return null;
    return Timestamp.fromDate(dateTime);
  }

  static List<String>? tokenToJson(List<String>? tokens) => tokens;
  static List<String>? tokenFromJson(dynamic tokens) {
    if (tokens is List<dynamic>) {
      return tokens.map((e) => e.toString()).toList();
    } else {
      if (tokens == null) {
        return null;
      } else {
        List<String> newListToken = [tokens as String];

        return newListToken;
      }
    }
  }
}
