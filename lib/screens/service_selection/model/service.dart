import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class ServiceModel {
  ServiceModel({
    required this.title,
    required this.module,
    required this.active,
  });

  final String title;
  final String module;
  final bool active;

  static ServiceModel empty() => ServiceModel(title: '', module: '', active: false);

  factory ServiceModel.fromSnapshot(data) {
    return ServiceModel(
      title: data['Title'],
      module: data['Module'],
      active: data['Active'],
    );
  }
}
