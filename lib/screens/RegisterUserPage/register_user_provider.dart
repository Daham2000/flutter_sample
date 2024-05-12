import 'package:flu/bloc/NotificationCubit.dart';
import 'package:flu/screens/RegisterUserPage/register_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterUserPageProvider extends StatelessWidget {
  const RegisterUserPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit(),
      child: RegisterPage(),
    );
  }
}