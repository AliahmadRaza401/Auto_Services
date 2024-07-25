import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class CarRepairServiceModel {
  CarRepairServiceModel({required this.title, required this.module, required this.image, required this.active});

  final String title;
  final String module;
  final String image;
  final bool active;

  static CarRepairServiceModel empty() => CarRepairServiceModel(title: '', module: '', active: false, image: '');

  factory CarRepairServiceModel.fromSnapshot(Map<String, dynamic> data) {
    return CarRepairServiceModel(title: data['Title'], module: data['Module'], image: data['Image'], active: data['Active']);
  }

  Map<String, dynamic> toJson() => {'Title': title, 'Module': module, 'Image': image, 'Active': active};
}
