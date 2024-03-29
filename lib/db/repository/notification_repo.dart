import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification.dart';

class NotificationManager {
  final CollectionReference _notificationsCollection =
      FirebaseFirestore.instance.collection('notifications');

  Future<void> addNotification(Notifications notification) async {
    try {
      await _notificationsCollection.add(notification.toMap());
      print('Notification added successfully');
    } catch (e) {
      print('Error adding notification: $e');
    }
  }

  Future<List<Notifications>> getNotifications() async {
    try {
      QuerySnapshot querySnapshot = await _notificationsCollection.get();
      return querySnapshot.docs
          .map((doc) => Notifications.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error getting notifications: $e');
      return [];
    }
  }

  Future<void> updateNotification(Notifications notification) async {
    try {
      await _notificationsCollection
          .doc(notification.id)
          .update(notification.toMap());
      print('Notification updated successfully');
    } catch (e) {
      print('Error updating notification: $e');
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      await _notificationsCollection.doc(notificationId).delete();
      print('Notification deleted successfully');
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }
}
