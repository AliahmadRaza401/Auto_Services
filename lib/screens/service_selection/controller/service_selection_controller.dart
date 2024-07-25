import 'package:auto_services/screens/service_selection/model/service.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class ServiceSelectionController extends GetxController {

  /// Variables
  final isLoading = false.obs;
  final services = RxList<ServiceModel>();
  final _firestore = FirebaseFirestore.instance;

  /// Functions

  // Fetch Services
  fetchServices() async {
    try {
      isLoading.value = true;

      final response = await _firestore.collection('Resources').get();
      final data = response.docs.first.data();
      services.value = List<ServiceModel>.from(data['Services'].map((item) => ServiceModel.fromSnapshot(item)));

      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchServices();
  }

  final List homecard = [
    // {
    //   "title": "Tyre Change",
    //   "func": () {
    //     Get.toNamed("/");
    //   },
    // },

    {
      "title": "Car Tow",
      "func": () {
        selectedService.value = 'Car-Tow';
        Get.toNamed("/cartowbottomnav");
      },
    },
    // {
    //   "title": "Oil Change",
    //   "func": () {
    //     Get.toNamed("/");
    //   },
    // },
    {
      "title": "Car Repair",
      "func": () {
        selectedService.value = 'Car-Repair';
        Get.toNamed("/carrepairbottomnav");
      },
    },
    {
      "title": "Technical Test",
      "func": () {
        selectedService.value = 'Tech-Test';
        Get.toNamed("/technicaltest");
      },
    },
    // {
    //   "title": "Battery Change",
    //   "func": () {
    //     Get.toNamed("/");
    //   },
    // },

    // {
    //   "title": "Scrups",
    //   "icon": Icons.home,
    //   "func": () {
    //     Get.toNamed("/");
    //   },
    // },
  ];
}
