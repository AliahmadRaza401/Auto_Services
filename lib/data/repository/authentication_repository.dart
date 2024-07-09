import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      print('logged In');
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true ? print('login') : print('first time');
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
      print('login');
      // Get.offAll(() => const LoginScreen());
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
