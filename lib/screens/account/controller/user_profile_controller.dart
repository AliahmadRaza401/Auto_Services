import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

import '../../../data/service/network_manager.dart';
import '../../../functions/image_picker_dialog.dart';
import '../../../functions/image_storage.dart';
import '../../../utils/loader.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final editProfileFormKey = GlobalKey<FormState>();
  final name = TextEditingController(text: userData.value?.name ?? '');
  final email = TextEditingController(text: userData.value?.email ?? '');
  final phone = TextEditingController(text: userData.value?.phone ?? '');
  final profileImg = Rxn<File>();
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /// Functions
  // Pick Image
  pickProfileImg(BuildContext context) async {
    try {
      final image = await showImagePicker(context);
      if (image != null) {
        profileImg.value = File(image.path);
      }
    } on Exception catch (e) {
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Update Profile
  updateProfileFunc() async {
    try {
      // Check Form Validation
      if (!editProfileFormKey.currentState!.validate()) return;

      // Show Loading
      KLoaders.showFullScreenLoader(text: 'Updating Profile');

      // Check Internet Connectivity
      final connection = await NetworkManager.instance.isConnected();
      if (!connection) {
        KLoaders.closeFullScreenLoader();
        return;
      }

      // Check new email uniqueness
      final result = await _fireStore.collection('Users').where('Email', isEqualTo: email.text.trim()).where('Id', isNotEqualTo: userData.value?.id).get();
      if (result.docs.isNotEmpty) {
        KSnackBar().infoSnackBar('Email Already used by other user');
        return;
      }

      // Save Profile Image and get image url
      dynamic imageURL;
      if (profileImg.value != null) {
        imageURL = await storeFile(file: profileImg.value!, filenameWithPath: 'userProfiles/${userData.value?.id}');
      }

      // Update user profile attributes
      _fireStore.collection('Users').doc(userData.value?.id).update({
        'Name': name.text.trim(),
        'Email': email.text.trim(),
        'Phone': phone.text.trim(),
        'ProfilePic': imageURL ?? '',
      });
      // Update user email in firebase auth
      _auth.currentUser?.updateEmail(email.text.trim());

      userData.value?.email = email.text.trim();
      userData.value?.name = name.text.trim();
      userData.value?.phone = phone.text.trim();
      userData.value?.profilePic = imageURL ?? userData.value?.profilePic;

      // Close full screen loader and show success SnackBar
      KLoaders.closeFullScreenLoader();
      Get.back();
      KSnackBar().successSnackBar('Profile Updated Successfully');
      update();
    } catch (e) {
      // Close full screen loader
      KLoaders.closeFullScreenLoader();

      // Show error message
      KSnackBar().errorSnackBar(e.toString());
    }
  }
}
