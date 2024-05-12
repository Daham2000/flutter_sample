import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flu/screens/HomePage/home_page_provider.dart';
import 'package:flu/screens/LoginPage/login_page_provider.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginPageProvider();
        }

        return const HomePageProvider();
      },
    );
  }
}
