import 'package:flutter/material.dart';

class ThemeInfo with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get chosenTheme {
    return _themeMode;
  }

  void toggleTheme(bool isDarkModeEnabled){
    if(!isDarkModeEnabled)
      _themeMode = ThemeMode.light;
    else
      _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}