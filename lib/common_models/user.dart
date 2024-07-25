import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.fcmToken,
    required this.profilePic,
  });
  String id;
  String name;
  String email;
  String phone;
  String type;
  String fcmToken;
  String profilePic;

  static UserModel empty() => UserModel(
        id: '',
        email: '',
        phone: '',
        type: '',
        name: '',
        fcmToken: '',
        profilePic: '',
      );

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['Name'],
        email: data['Email'],
        phone: data['Phone'],
        type: data['Type'],
        fcmToken: data['FCMToken'],
        profilePic: data['ProfilePic'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Type': type,
        'Email': email,
        'Phone': phone,
        'FCMToken': fcmToken,
        'ProfilePic': profilePic,
      };
}
