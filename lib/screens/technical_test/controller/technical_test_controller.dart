import 'package:auto_services/common_models/brand.dart';
import 'package:auto_services/screens/technical_test/view/technical_test_home.dart';
import 'package:auto_services/utils/loader.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_models/booking.dart';
import '../../../common_models/car.dart';
import '../../../common_models/notification.dart';
import '../../../common_models/tech_test_report.dart';
import '../../../utils/constants.dart';
import '../../../widgets/snackbars.dart';

class TechnicalTestController extends GetxController {
  static TechnicalTestController get instance => Get.find();

  /// Variables
  final _fireStore = FirebaseFirestore.instance;
  final isLoading = false.obs;
  final selectedBrand = Rxn<BrandModel>();
  final selectedCarModel = Rxn<CarModel>();
  final manufacturingYear = Rxn<String>();
  final preferredDate = Rxn<String>();
  final preferredTime = Rxn<String>();
  final techTestList = RxList<BookingModel>();
  final brandList = RxList<BrandModel>();
  final carList = RxList<CarModel>();
  final selectedBooking = Rxn<BookingModel>();
  final selectedReport = Rxn<TechTestReportModel>();
  final techTestNotifications = RxList<NotificationModel>();

  /// Functions

  // Get All Car Brands
  fetchBrands() async {
    try {
      isLoading.value = true;

      final response = await _fireStore.collection('Resources').get();
      final data = response.docs.first.data();
      brandList.value = List<BrandModel>.from(data['Brands'].map((item) => BrandModel.fromJson(item)));

      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Get Brand Cars
  fetchBrandCars() async {
    try {
      isLoading.value = true;
      carList.clear();
      final response = await _fireStore.collection('Resources').get();
      final data = response.docs.first.data();
      for (var item in data['Cars']) {
        if (item['Brand'] == selectedBrand.value?.name) {
          carList.add(CarModel.fromJson(item));
        }
      }
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Book Technical Test
  bookTechnicalTest() async {
    try {
      if (selectedBrand.value == null || selectedCarModel.value == null || manufacturingYear.value == null || preferredDate.value == null || preferredTime.value == null) {
        KSnackBar().infoSnackBar('Please provide all fields information');
        return;
      }
      KLoaders.showFullScreenLoader(text: 'Booking for Car Technical Testing');
      final bookingData = BookingModel(
        id: '',
        mainService: selectedService.value ?? '',
        source: '',
        sourceLatLng: null,
        destination: '',
        destinationLatLng: null,
        preferredDate: preferredDate.value ?? '',
        preferredTime: preferredTime.value ?? '',
        brand: selectedBrand.value?.name ?? '',
        car: selectedCarModel.value?.name ?? '',
        carModel: manufacturingYear.value ?? '',
        paymentStatus: '',
        customerId: userData.value?.id ?? '',
        customerName: userData.value?.name ?? '',
        customerContactNo: userData.value?.phone ?? '',
        customerProfilePic: userData.value?.profilePic ?? '',
        mechanicId: '',
        mechanicName: '',
        mechanicContactNo: '',
        mechanicProfilePic: '',
        subService: '',
        subServiceDetail: null,
        status: 'Pending',
      );
      _fireStore.collection('Booking').add(bookingData.toJson());

      KLoaders.closeFullScreenLoader();
      Get.offUntil(MaterialPageRoute(builder: (context) => const TechnicalTestHome()), (Route<dynamic> route) => false);
      KSnackBar().successSnackBar('Booked Successfully');
    } on FirebaseException catch (e) {
      KLoaders.closeFullScreenLoader();
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      KLoaders.closeFullScreenLoader();
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Fetch Customer All Tech Test
  fetchTechTest() async {
    try {
      isLoading.value = true;

      final response = await _fireStore.collection('Booking').where('MainService', isEqualTo: 'Tech-Test').where('CustomerId', isEqualTo: userData.value?.id).get();
      techTestList.value = List<BookingModel>.from(response.docs.map((item) => BookingModel.fromSnapshot(item)));
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Fetch Booking Tech Test Report
  fetchBookingTechTestReport({required String bookingId}) async {
    try {
      isLoading.value = true;
      final response = await _fireStore.collection('TechTestReports').where('BookingId', isEqualTo: bookingId).get();
      if (response.docs.isNotEmpty) {
        selectedReport.value = TechTestReportModel.fromSnapshot(response.docs.first);
      }
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Stream of Notifications
  Stream<List<NotificationModel>> getNotifications() {
    List<NotificationModel> records = [];
    Stream<QuerySnapshot> snapshots = _fireStore.collection('Notifications').where('ServiceType', isEqualTo: 'Tech-Test').where('To', isEqualTo: userData.value?.id).snapshots();
    snapshots.listen((QuerySnapshot query) {
      if (query.docChanges.isNotEmpty) {
        records.clear();
      }
    });
    return snapshots.map((snapshot) {
      for (var item in snapshot.docs) {
        records.add(NotificationModel.fromSnapshot(item as DocumentSnapshot<Map<String, dynamic>>));
      }
      return records.toList();
    });
  }

  @override
  void onInit() {
    super.onInit();
    techTestNotifications.bindStream(getNotifications());
  }
}
