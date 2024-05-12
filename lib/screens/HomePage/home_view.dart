import 'package:flu/bloc/NotificationCubit.dart';
import 'package:flu/db/models/notification.dart';
import 'package:flu/utils/UtilityService.dart';
import 'package:flu/widgets/excersise_tile.dart';
import 'package:flu/screens/NotificationPage/notifications_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ConnectionCubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        body: BlocBuilder<NotificationCubit, List<Notifications>>(
                builder: (context, notifications) {
              return SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 2),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, John",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    UtilityService().getDateTimeDashboard(),
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue[600],
                                    borderRadius: BorderRadius.circular(12)),
                                child: IconButton(
                                  padding: const EdgeInsets.all(12),
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationPage()),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 9.0),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        color: Colors.grey[100],
                        child: Center(
                            child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exercises",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ExcersiceTile(
                              exercise: 'Speaking skills',
                              exerciseName: '15 Exercises',
                              icon: Icons.favorite,
                              color: Colors.orange,
                            ),
                            ExcersiceTile(
                              exercise: 'Reading skills',
                              exerciseName: '22 Exercises',
                              icon: Icons.person,
                              color: Colors.green,
                            ),
                            ExcersiceTile(
                              exercise: 'Writing skills',
                              exerciseName: '08 Exercises',
                              icon: Icons.star,
                              color: Colors.pink,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              );
            }),);
  }
}
