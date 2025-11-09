import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green[600],
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: Colors.green[600]!,
      secondary: Colors.blue[600]!,
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.green[700],
      unselectedItemColor: Colors.grey[500],
    ),
    fontFamily: 'Roboto',
    useMaterial3: true,
  );
}