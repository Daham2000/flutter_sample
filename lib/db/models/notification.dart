import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  final String id;
  final String title;
  final String description;

  Notifications({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Notifications.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Notifications(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}
