import 'package:flutter/material.dart';

class ThemeInfo with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get chosenTheme {
    return _themeMode;
  }

  void toggleTheme(){
    if(_themeMode == ThemeMode.dark)
      _themeMode = ThemeMode.light;
    else if(_themeMode == ThemeMode.light)
      _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}