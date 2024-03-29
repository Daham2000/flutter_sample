import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Light theme colors
final Color _primaryColor = Colors.blue;
final Color _accentColor = Colors.orange;

// Dark theme colors
final Color? _darkPrimaryColor = Colors.blue[700];
final Color _darkAccentColor = Colors.orange[700]!;

// Light theme
final ThemeData lightTheme = ThemeData(
  primaryColor: _primaryColor,
  hintColor: _accentColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: _primaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: _primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.grey[600]),
  ),
);

// Dark theme
final ThemeData darkTheme = ThemeData(
  primaryColor: _darkPrimaryColor,
  hintColor: _darkAccentColor,
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    color: _darkPrimaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: _darkPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.grey[400]),
  ),
);

// Function to toggle between light and dark theme
ThemeData getTheme(bool isDarkMode) {
  return isDarkMode ? darkTheme : lightTheme;
}
