import 'package:flu/bloc/NotificationCubit.dart';
import 'package:flu/screens/HomePage/home_page_provider.dart';
import 'package:flu/screens/RegisterUserPage/register_user_provider.dart';
import 'package:flu/screens/RegisterUserPage/register_user_view.dart';
import 'package:flu/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../db/models/notification.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  String _errorMessage = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    // Simple email validation using a regular expression
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, List<Notifications>>(
        builder: (context, notifications) {
      return GestureDetector(
        onTap: () {
          // Close the keyboard when the user taps outside the text fields
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Welcome back!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            // Add more password validation logic if needed
                            return null;
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                if (!_isLoading)
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                            _errorMessage = "";
                          });
                          try {
                            await _authService.signInWithEmailAndPassword(
                                _emailController.value.text,
                                _passwordController.value.text);
                            print('Signed in successfully');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageProvider()));
                          } catch (e) {
                            print('Failed to sign in: $e');
                            setState(() {
                              _errorMessage =
                                  "Wrong Email or Password, try again.";
                            });
                          }
                          setState(() {
                            _isLoading =
                                false; // Show loader when login is clicked
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_isLoading) Center(child: CircularProgressIndicator()),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add navigation logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUserPageProvider()));
                    },
                    child: Text(
                      'Don\'t have an account? Sign up',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                if (_errorMessage.isNotEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
