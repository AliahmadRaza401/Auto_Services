import 'package:auto_services/common_models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../data/service/firebase_message_service.dart';
import '../../../data/service/network_manager.dart';
import '../../../utils/loader.dart';
import '../../../widgets/snackbars.dart';

class RegistrationController extends GetxController {
  static RegistrationController get instance => Get.find();

  /// Variables
  final showPass = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final agreeTermsCheck = false.obs;

  /// Methods
  registerFunc() async {
    try {
      // Check Form Validation
      if (!registerFormKey.currentState!.validate()) return;

      if (!agreeTermsCheck.value) {
        KSnackBar().infoSnackBar('Please Agree to Terms and Privacy Policies before continue');
        return;
      }

      // Show Loading
      KLoaders.showFullScreenLoader(text: 'Registration in Process');

      // Check Internet Connectivity
      final connection = await NetworkManager.instance.isConnected();
      if (!connection) {
        KLoaders.closeFullScreenLoader();
        return;
      }

      // Register User in the Firebase Authentication and store user data in Firebase
      final userCredentials = await AuthenticationRepository.instance.registerWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());

      // Get FCM Token for notification service
      final fcmToken = await FirebaseMessagingService.getFCMToken();

      // Convert to user model and assign userdata after registration
      UserModel userData = UserModel(
        id: userCredentials?.user?.uid ?? '',
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        type: 'Consumer',
        fcmToken: fcmToken ?? '',
        profilePic: '',
      );

      // Save Authenticated user data in the Firebase Firestore
      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(userData);

      // Close full screen loader and show success SnackBar
      KLoaders.closeFullScreenLoader();
      KSnackBar().successSnackBar('Congratulations! your account has been registered successfully');

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Close full screen loader
      KLoaders.closeFullScreenLoader();

      // Show error message
      KSnackBar().errorSnackBar(e.toString());
    }
  }
}
