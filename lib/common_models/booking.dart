import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class BookingModel {
  BookingModel({
    required this.id,
    required this.mainService,
    required this.subService,
    required this.subServiceDetail,
    required this.source,
    required this.destination,
    required this.preferredDate,
    required this.brand,
    required this.carId,
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
  final String destination;
  final String preferredDate;
  final String brand;
  final String paymentStatus;
  final String carId;
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
        carId: '',
        destination: '',
        preferredDate: '',
        mainService: '',
        subService: '',
        subServiceDetail: null,
        source: '',
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
        subServiceDetail: data['SubServiceDetail'] ?? '',
        source: data['Source'] ?? '',
        destination: data['Destination'] ?? '',
        brand: data['Brand'] ?? '',
        carId: data['CarId'] ?? '',
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
        'Destination': destination,
        'Brand': brand,
        'CarId': carId,
        'PreferredDate': preferredDate,
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
