import 'package:flu/bloc/NotificationCubit.dart';
import 'package:flu/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../db/models/notification.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, List<Notifications>>(
        builder: (context, notifications) {
      return Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[800],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      print("Index:  " + index.toString());
                      final notification = notifications[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          TextPreviewWidget(
                            exercise: notification.title,
                            exerciseName: notification.description,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
