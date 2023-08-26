import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.light(
        background: Colors.blueGrey.shade50,
        primary: Colors.white,
        secondary: Colors.green.shade100,
        onPrimary: Colors.blue.shade100,
        onSecondary: Colors.red.shade100,
        tertiary: Colors.black,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor:
            Colors.white, // Set app bar background color for light theme
        foregroundColor: Colors.black, // Set app bar text color for light theme
      ),
    );
  }
}

class DarkTheme {
  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.light(
        background: Colors.black38,
        primary: Colors.blueGrey,
        secondary: Colors.green.shade500,
        onPrimary: Colors.blue.shade500,
        onSecondary: Colors.red.shade500,
        tertiary: Colors.white,
      ),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors
            .blueGrey.shade800, // Set app bar background color for dark theme
        foregroundColor: Colors.white, // Set app bar text color for dark theme
      ),
    );
  }
}
