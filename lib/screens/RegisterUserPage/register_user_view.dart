import 'package:flu/screens/HomePage/home_page_provider.dart';
import 'package:flu/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _registerWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    try {
      await AuthService().registerWithEmailAndPassword(
          _emailController.value.text, _passwordController.value.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePageProvider()));
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to register, try again!';
      });
    } finally {
      setState(() {
        _isLoading = false; // Hide loader when register is complete
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100.0),
                Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add more password validation logic if needed
                    return null;
                  },
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add more password validation logic if needed
                    return null;
                  },
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm the password';
                    }
                    // Add more password validation logic if needed
                    else {
                      if (_passwordController.value.text != value) {
                        return "Password doesn't match";
                      }
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () => {
                              if (_formKey.currentState!.validate())
                                {_registerWithEmailAndPassword()}
                            },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 20.0),
                if (_errorMessage.isNotEmpty)
                  Center(
                    child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
