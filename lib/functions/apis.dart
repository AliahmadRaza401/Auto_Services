// import '../widgets/widgets_imports.dart';
//
// class Apis {
//   static String baseUrl = "domain.com";
//   static const String version = "/api";
//
//   static const Map<String, dynamic> dummyParams = {'query': '""'};
//
//   static getAPI({
//     required String apiRoute,
//     String apiVersion = version,
//     Map<String, String> apiHeaders = headers,
//     Map<String, dynamic> params = dummyParams,
//     bool returnData = false,
//   }) async {
//     try {
//       final result = await InternetAddress.lookup("example.com");
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         try {
//           var url = Uri.https(baseUrl, apiVersion + apiRoute, params);
//
//           final response = await get(
//             url,
//             headers: apiHeaders,
//           );
//           if (response.statusCode == 200) {
//             var jsonRes = jsonDecode(response.body);
//             if (jsonRes["status"] == true) {
//               return returnData ? jsonRes["data"] : "success";
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
//
//   static postAPI({
//     required String apiRoute,
//     required var jsonBody,
//     String apiVersion = version,
//     Map<String, String> apiHeaders = headers,
//     bool returnData = false,
//   }) async {
//     try {
//       final result = await InternetAddress.lookup("example.com");
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         try {
//           var url = Uri.https(baseUrl, apiVersion + apiRoute);
//
//           final response = await post(
//             url,
//             headers: apiHeaders,
//             body: jsonEncode(jsonBody),
//           );
//           if (response.statusCode == 200) {
//             var jsonRes = jsonDecode(response.body);
//             if (jsonRes["status"] == true) {
//               return returnData ? jsonRes["data"] : "success";
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
