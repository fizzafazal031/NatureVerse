import 'package:flutter/material.dart';

class AppSettings {
  static ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  static ValueNotifier<double> fontScale = ValueNotifier(1.0);

  static ValueNotifier<bool> notifications = ValueNotifier(true);

  static ValueNotifier<bool> sound = ValueNotifier(true);

  static ValueNotifier<bool> vibration = ValueNotifier(true);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Color(0xFFF7FAF5),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF347A45),
      foregroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF121A14),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1B3322),
      foregroundColor: Colors.white,
    ),
  );
}
