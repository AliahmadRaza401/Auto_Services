// import '../../../../widgets/widgets_imports.dart';
//
// class LoginServices{
//   loginFunc({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final result = await InternetAddress.lookup("example.com");
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         try {
//           var jsonBody = {
//             "email": email,
//             "password": password,
//           };
//           var url = Uri.https(Apis().baseUrl, Apis().version + login);
//
//           final response = await post(
//             url,
//             headers: headers,
//             body: jsonEncode(jsonBody),
//           );
//           if (response.statusCode == 200) {
//             var jsonRes = jsonDecode(response.body);
//             if (jsonRes["result"] == true) {
//               await saveLoginResponse(jsonRes["user"]);
//               KSnackBar().successSnackBar("Login Successfully!!");
//               return "success";
//             } else {
//               KSnackBar().errorSnackBar(jsonRes["message"]);
//               return "error";
//             }
//           } else {
//             KSnackBar().errorSnackBar(response.reasonPhrase);
//             return "error";
//           }
//         } catch (e) {
//           KSnackBar().errorSnackBar(e.toString());
//           return "error";
//         }
//       }
//     } on SocketException catch (_) {
//       KSnackBar().errorSnackBar("No Internet");
//       return "error";
//     }
//   }
// }
