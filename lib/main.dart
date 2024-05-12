import 'package:flu/bloc/NotificationCubit.dart';
import 'package:flu/screens/LoginPage/login_page_provider.dart';
import 'package:flu/services/auth_gate.dart';
import 'package:flu/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme, // Set the light theme as the default
      darkTheme: darkTheme, // Set the dark theme
      themeMode: ThemeMode.system, // Use system theme mode (light or dark)
      home: BlocProvider(
        create: (_) => NotificationCubit(),
        child: const AuthGate(),
      ),
    );
  }
}
