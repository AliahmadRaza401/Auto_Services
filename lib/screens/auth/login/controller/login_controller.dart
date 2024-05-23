// import '../../widgets/widgets_imports.dart';
//
// class LoginController extends GetxController {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   final isLoading = false.obs;
//
//   loginFunc() async {
//     isLoading.value = true;
//     var apiResponse = await Apis().loginFunc(
//       email: emailController.text,
//       password: passwordController.text,
//     );
//     if (apiResponse == 'error') {
//       isLoading.value = false;
//     } else {
//       Get.offAllNamed('/');
//       emailController.clear();
//       passwordController.clear();
//     }
//   }
// }
