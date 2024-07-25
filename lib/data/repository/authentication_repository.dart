import 'dart:async';
import 'package:auto_services/common_models/user.dart';
import 'package:auto_services/screens/onboarding.dart';
import 'package:auto_services/screens/service_selection/view/service_selection_screen.dart';
import 'package:auto_services/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../screens/auth/view/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      final response = await _fireStore.collection('Users').doc(user.uid).get();
      userData.value = UserModel.fromSnapshot(response);
      Get.offAll(() => ServiceSelectionScreen());
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
    }
  }

/* -------------------- Email & Password Sign-In -------------------- */

  /// [EmailAuthentication] - SignIn
  Future<UserCredential?> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    } on FirebaseException catch (e) {
      throw e.message ?? '';
    } on FormatException catch (_) {
    } on PlatformException catch (e) {
      throw e.message ?? '';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential?> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    } on FirebaseException catch (e) {
      throw e.message ?? '';
    } on FormatException catch (_) {
    } on PlatformException catch (e) {
      throw e.message ?? '';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - Mail Verification

  /// [EmailAuthentication] - Forgot Password

/* -------------------- End Email & Password Sign-In -------------------- */

/* -------------------- User Sign-Out -------------------- */

  /// [Logout User] - Logout user from firebase and app
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    } on FirebaseException catch (e) {
      throw e.message ?? '';
    } on FormatException catch (_) {
    } on PlatformException catch (e) {
      throw e.message ?? '';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/* -------------------- End User Sign-Out -------------------- */
}
