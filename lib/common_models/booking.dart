import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class BookingModel {
  BookingModel({
    required this.id,
    required this.mainService,
    required this.subService,
    required this.subServiceDetail,
    required this.source,
    required this.sourceLatLng,
    required this.destination,
    required this.destinationLatLng,
    required this.preferredDate,
    required this.brand,
    required this.car,
    required this.carModel,
    required this.preferredTime,
    required this.paymentStatus,
    required this.customerId,
    required this.customerName,
    required this.customerContactNo,
    required this.customerProfilePic,
    required this.mechanicId,
    required this.mechanicName,
    required this.mechanicContactNo,
    required this.mechanicProfilePic,
    required this.status,
  });
  final String id;
  final String mainService;
  final String subService;
  final Map<String, dynamic>? subServiceDetail;
  final String source;
  final GeoPoint? sourceLatLng;
  final String destination;
  final GeoPoint? destinationLatLng;
  final String preferredDate;
  final String paymentStatus;
  final String brand;
  final String car;
  final String carModel;
  final String preferredTime;
  final String customerId;
  final String customerName;
  final String customerContactNo;
  final String customerProfilePic;
  final String mechanicId;
  final String mechanicName;
  final String mechanicContactNo;
  final String mechanicProfilePic;
  final String status;

  static BookingModel empty() => BookingModel(
        id: '',
        brand: '',
        car: '',
        carModel: '',
        preferredTime: '',
        preferredDate: '',
        mainService: '',
        subService: '',
        subServiceDetail: null,
        source: '',
        sourceLatLng: null,
        destination: '',
        destinationLatLng: null,
        paymentStatus: '',
        customerId: '',
        customerName: '',
        customerContactNo: '',
        customerProfilePic: '',
        mechanicId: '',
        mechanicName: '',
        mechanicContactNo: '',
        mechanicProfilePic: '',
        status: '',
      );

  factory BookingModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BookingModel(
        id: document.id,
        mainService: data['MainService'] ?? '',
        subService: data['SubService'] ?? '',
        subServiceDetail: data['SubServiceDetail'] ?? {},
        source: data['Source'] ?? '',
        sourceLatLng: data['SourceLatLng'],
        destination: data['Destination'] ?? '',
        destinationLatLng: data['DestinationLatLng'],
        brand: data['Brand'] ?? '',
        car: data['Car'] ?? '',
        carModel: data['CarModel'] ?? '',
        preferredTime: data['PreferredTime'] ?? '',
        preferredDate: data['PreferredDate'] ?? '',
        paymentStatus: data['PaymentStatus'] ?? '',
        mechanicId: data['MechanicId'] ?? '',
        mechanicName: data['MechanicName'] ?? '',
        mechanicContactNo: data['MechanicContactNo'] ?? '',
        mechanicProfilePic: data['MechanicProfilePic'] ?? '',
        customerId: data['CustomerId'] ?? '',
        customerContactNo: data['CustomerContactNo'] ?? '',
        customerProfilePic: data['CustomerProfilePic'] ?? '',
        customerName: data['CustomerName'] ?? '',
        status: data['Status'] ?? '',
      );
    } else {
      return BookingModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        'MainService': mainService,
        'SubService': subService,
        'SubServiceDetail': subServiceDetail,
        'Source': source,
        'SourceLatLng': sourceLatLng,
        'Destination': destination,
        'DestinationLatLng': destinationLatLng,
        'Brand': brand,
        'Car': car,
        'CarModel': carModel,
        'PreferredDate': preferredDate,
        'PreferredTime': preferredTime,
        'PaymentStatus': paymentStatus,
        'Status': status,
        'CustomerId': customerId,
        'CustomerName': customerName,
        'CustomerContactNo': customerContactNo,
        'CustomerProfilePic': customerProfilePic,
        'MechanicId': mechanicId,
        'MechanicName': mechanicName,
        'MechanicContactNo': mechanicContactNo,
        'MechanicProfilePic': mechanicProfilePic,
      };
}
