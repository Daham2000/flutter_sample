import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flu/screens/HomePage/home_page_provider.dart';
import 'package:flu/screens/LoginPage/login_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ConnectionCubit.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginPageProvider(); // Ensure LoginPageProvider is a properly defined widget
        }

        return Column(
          children: [
            Expanded(child: const HomePageProvider()),
            Container(
                width: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: BlocBuilder<ConnectionCubit, bool>(
                    builder: (context, status) {
                  if (status == true) {
                    return Container();
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.wifi_off, color: Colors.white),
                          SizedBox(width: 10),
                          Text('Device is Offline',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    );
                  }
                })) // Ensure HomePageProvider is a properly defined widget
          ],
        );
      },
    );
  }
}
