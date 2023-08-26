import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
