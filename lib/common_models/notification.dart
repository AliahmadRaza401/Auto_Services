import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class NotificationModel {
  NotificationModel({
    required this.from,
    required this.to,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.serviceType,
    required this.isRead,
  });

  final String from;
  final String to;
  final String title;
  final String description;
  final Timestamp timestamp;
  final String serviceType;
  final bool isRead;

  static NotificationModel empty() => NotificationModel(
        from: '',
        to: '',
        title: '',
        description: '',
        timestamp: Timestamp.now(),
        serviceType: '',
        isRead: false,
      );

  factory NotificationModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return NotificationModel(
        from: data['From'] ?? '',
        to: data['To'] ?? '',
        title: data['Title'] ?? '',
        description: data['Description'] ?? '',
        timestamp: data['TimeStamp'],
        serviceType: data['ServiceType'],
        isRead: data['IsRead'] ?? false,
      );
    } else {
      return NotificationModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        'From': from,
        'To': to,
        'Title': title,
        'Description': description,
        'ServiceType': serviceType,
        'IsRead': isRead,
        'TimeStamp': timestamp,
      };
}
