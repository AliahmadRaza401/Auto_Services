// import '../../widgets/widgets_imports.dart';
//
// class LoginCheckController extends GetxController {
//   checkLogin() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var token = pref.getString("LoginResponse");
//
//     if (token != null) {
//       userModel.value = UserModel.fromMap(jsonDecode(token));
//       isLoggedIn.value = true;
//       Get.offAllNamed('/');
//     } else {
//       isLoggedIn.value = false;
//       Get.offAllNamed('/login');
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     checkLogin();
//   }
// }
