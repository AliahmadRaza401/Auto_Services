import 'package:auto_services/common_models/booking.dart';
import 'package:auto_services/common_models/notification.dart';
import 'package:auto_services/screens/car_repair/model/car_service_pkgs.dart';
import 'package:auto_services/screens/car_repair/view/car_repair_bottomnavbar.dart';
import 'package:auto_services/utils/loader.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import '../../../common_models/user.dart';
import '../model/car_repair_service.dart';

class CarRepairController extends GetxController {
  static CarRepairController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final selectedPageIndex = 0.obs;
  final _fireStore = FirebaseFirestore.instance;
  final searchController = TextEditingController();
  final carServices = RxList<CarRepairServiceModel>();
  final selectedRepairService = Rxn<CarRepairServiceModel>();
  final carRepairBookings = RxList<BookingModel>();
  final carRepairNotifications = RxList<NotificationModel>();

  /// Functions

  // Update Page Index on Bottom Nav Tab Click
  updatePageIndex(int index) => selectedPageIndex.value = index;

  // Get All Car Repair Services
  fetchCarRepairServices() async {
    try {
      isLoading.value = true;
      final response = await _fireStore.collection('Resources').get();
      final data = response.docs.first.data();
      carServices.value = List<CarRepairServiceModel>.from(data['CarRepairServices'].map((item) => CarRepairServiceModel.fromSnapshot(item)));
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  /// Car Service
  final carMechanics = RxList<UserModel>();
  final selectedMechanic = Rxn<UserModel>();
  final carServicePkgs = RxList();

  // Function to fetch mechanics
  fetchMechanics() async {
    try {
      isLoading.value = true;
      final response = await _fireStore.collection('Users').where('Type', isEqualTo: 'Mechanic').where('RepairServices', arrayContains: selectedRepairService.value?.module).get();
      carMechanics.value = List<UserModel>.from(response.docs.map((item) => UserModel.fromSnapshot(item)));
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Function to fetch car service packages
  fetchCarServicePkgs() async {
    try {
      isLoading.value = true;
      final response = await _fireStore.collection('Resources').get();
      final data = response.docs.first.data();
      carServicePkgs.value = List<CarServicePkgsModel>.from(data['CarServicePkgs'].map((item) => CarServicePkgsModel.fromSnapshot(item)));
      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Function to book car service
  bookCarService({required CarServicePkgsModel serviceData}) async {
    try {
      KLoaders.showFullScreenLoader(text: 'Booking for Car Service');

      final bookingData = BookingModel(
        id: '',
        mainService: selectedService.value ?? '',
        source: '',
        sourceLatLng: null,
        destination: '',
        destinationLatLng: null,
        preferredDate: '',
        preferredTime: '',
        brand: '',
        car: '',
        carModel: '',
        paymentStatus: '',
        customerId: userData.value?.id ?? '',
        customerName: userData.value?.name ?? '',
        customerContactNo: userData.value?.phone ?? '',
        customerProfilePic: userData.value?.profilePic ?? '',
        mechanicId: selectedMechanic.value?.id ?? '',
        mechanicName: selectedMechanic.value?.name ?? '',
        mechanicContactNo: selectedMechanic.value?.phone ?? '',
        mechanicProfilePic: selectedMechanic.value?.profilePic ?? '',
        subService: selectedRepairService.value?.module ?? '',
        subServiceDetail: {
          ...serviceData.toJson(),
        },
        status: 'Pending',
      );
      _fireStore.collection('Booking').add(bookingData.toJson());

      final notification = NotificationModel(
        from: userData.value?.id ?? '',
        to: selectedMechanic.value?.id ?? '',
        isRead: false,
        title: 'New Car Repairing Request',
        description: 'Hi ${selectedMechanic.value?.name}, there is a new request for car repairing for you.',
        serviceType: selectedService.value ?? '',
        timestamp: Timestamp.fromDate(DateTime.now()),
      );
      _fireStore.collection('Notifications').add(notification.toJson());

      KLoaders.closeFullScreenLoader();
      Get.offUntil(MaterialPageRoute(builder: (context) => const CarRepairBottomNavBar()), (Route<dynamic> route) => false);
      KSnackBar().successSnackBar('Booked Successfully');
    } on FirebaseException catch (e) {
      KLoaders.closeFullScreenLoader();
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      KLoaders.closeFullScreenLoader();
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Stream of Bookings
  Stream<List<BookingModel>> getUserBookings() {
    List<BookingModel> records = [];
    Stream<QuerySnapshot> snapshots = _fireStore.collection('Booking').where('MainService', isEqualTo: 'Car-Repair').where('CustomerId', isEqualTo: userData.value?.id).snapshots();
    snapshots.listen((QuerySnapshot query) {
      if (query.docChanges.isNotEmpty) {
        records.clear();
      }
    });
    return snapshots.map((snapshot) {
      for (var item in snapshot.docs) {
        records.add(BookingModel.fromSnapshot(item as DocumentSnapshot<Map<String, dynamic>>));
      }
      return records.toList();
    });
  }

  // Stream of Notifications
  Stream<List<NotificationModel>> getNotifications() {
    List<NotificationModel> records = [];
    Stream<QuerySnapshot> snapshots = _fireStore.collection('Notifications').where('ServiceType', isEqualTo: 'Car-Repair').where('To', isEqualTo: userData.value?.id).snapshots();
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
    fetchCarRepairServices();
    carRepairBookings.bindStream(getUserBookings());
    carRepairNotifications.bindStream(getNotifications());
  }
}
