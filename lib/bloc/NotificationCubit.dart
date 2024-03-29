import 'package:flu/db/models/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../db/repository/notification_repo.dart';

class NotificationCubit extends Cubit<List<Notifications>> {

  NotificationCubit() : super([]) {
    addNotification();
  }

  Future<void> addNotification() async {
    List<Notifications> notifications = await NotificationManager().getNotifications();
    for (Notifications no in notifications) {
      state.add(no);
      emit(List.from(state));
    }
  }

  void removeNotification(Notifications notification) {
    state.remove(notification);
    emit(List.from(state));
  }

  void clearNotifications() {
    state.clear();
    emit(List.from(state));
  }
}
