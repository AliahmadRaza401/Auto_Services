// import '../widgets/widgets_imports.dart';
//
// saveLoginResponse(jsonData) async {
//   SharedPreferences loginResponse = await SharedPreferences.getInstance();
//   loginResponse.clear();
//   userModel.value = UserModel.fromMap(jsonData);
//   loginResponse.setString("LoginResponse", json.encode(jsonData));
// }
//
// logoutFunc() async {
//   SharedPreferences loginResponse = await SharedPreferences.getInstance();
//   loginResponse.clear();
//   Get.offAllNamed("/login");
// }
//
// Future convertToBase64(File? img) async {
//   var data = img!.readAsBytesSync();
//   var compressImage = await compressImageFunc(data);
//   return base64Encode(compressImage);
// }
//
// Future<Uint8List> compressImageFunc(Uint8List image) async {
//   var result = await FlutterImageCompress.compressWithList(
//     image,
//     quality: 2,
//     format: CompressFormat.webp,
//   );
//   return result;
// }
//
// Color lighten(Color c) {
//   int percent;
//   if (ThemeData.estimateBrightnessForColor(c) == Brightness.light) {
//     percent = 10;
//   } else {
//     percent = 30;
//   }
//   assert(1 <= percent && percent <= 100);
//   var p = percent / 100;
//   return Color.fromARGB(c.alpha, c.red + ((255 - c.red) * p).round(), c.green + ((255 - c.green) * p).round(),
//       c.blue + ((255 - c.blue) * p).round());
// }
//
// Color darken(Color c) {
//   int percent;
//   if (ThemeData.estimateBrightnessForColor(c) == Brightness.light) {
//     percent = 10;
//   } else {
//     percent = 30;
//   }
//   assert(1 <= percent && percent <= 100);
//   var f = 1 - percent / 100;
//   return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(), (c.blue * f).round());
// }
//
// Color calculateTextColor(Color background) {
//   return ThemeData.estimateBrightnessForColor(background) == Brightness.light ? KColors.kBlack : KColors.kWhite;
// }
