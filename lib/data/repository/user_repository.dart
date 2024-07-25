import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../common_models/user.dart';

/// Repository Class of user-related operation
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to get user data from Firestore.
  Future<UserModel?> getUserRecord(String uid) async {
    try {
      final document = await _db.collection('Users').doc(uid).get();
      final result = UserModel.fromSnapshot(document);
      return result;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
