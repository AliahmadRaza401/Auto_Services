import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import '../../../../data/repository/authentication_repository.dart';
import '../../../../data/service/firebase_message_service.dart';
import '../../../../data/service/network_manager.dart';
import '../../../../utils/loader.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final showPass = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final fireInstance = FirebaseFirestore.instance;
  final isLoading = false.obs;

  loginFunc() async {
    try {
      // Check Form Validation
      if (!loginFormKey.currentState!.validate()) return;

      // Show Loading
      KLoaders.showFullScreenLoader(text: 'Logging in Process');

      // Check Internet Connectivity
      final connection = await NetworkManager.instance.isConnected();
      if (!connection) {
        KLoaders.closeFullScreenLoader();
        return;
      }

      // Register User in the Firebase Authentication and store user data in Firebase
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());

      // Get FCM Token for notification service
      final fcmToken = await FirebaseMessagingService.getFCMToken();

      await fireInstance.collection('Users').doc(userCredentials?.user?.uid).update({'FCMToken': fcmToken ?? ''});

      // Close full screen loader and show success SnackBar
      KLoaders.closeFullScreenLoader();
      KSnackBar().successSnackBar('User logged in successfully');

      // Move to Home Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Close full screen loader
      KLoaders.closeFullScreenLoader();
      // Show error message
      KSnackBar().errorSnackBar(e.toString());
    }
  }
}
