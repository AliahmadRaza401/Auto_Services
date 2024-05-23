import 'package:auto_services/widgets/widgets_imports.dart';

class HomeScreenController extends GetxController {
  List homecard = [
    {
      "title": "Tyre Change",
      "func": () {
        Get.toNamed("/");
      },
    },
    {
      "title": "Spare Parts",
      "func": () {
        Get.toNamed("/serviceapproval");
      },
    },
    {
      "title": "Car Tow",
      "func": () {
        Get.toNamed("/cartowbottomnav");
      },
    },
    {
      "title": "Oil Change",
      "func": () {
        Get.toNamed("/");
      },
    },
    {
      "title": "Car Repair",
      "func": () {
        Get.toNamed("/carrepairbottomnav");
      },
    },
    {
      "title": "Battery Change",
      "func": () {
        Get.toNamed("/");
      },
    },

    // {
    //   "title": "Scrups",
    //   "icon": Icons.home,
    //   "func": () {
    //     Get.toNamed("/");
    //   },
    // },
  ];
}
