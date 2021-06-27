import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeInfo with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get chosenTheme {
    return _themeMode;
  }

  void toggleTheme(bool isDarkModeEnabled) async {
    if(!isDarkModeEnabled)
      _themeMode = ThemeMode.light;
    else
      _themeMode = ThemeMode.dark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('currentMode', (_themeMode == ThemeMode.light)?'light':'dark');
  }

  Future<void> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('currentMode'))
      return;
    final storedData = prefs.getString('currentMode');
    if(storedData == 'light')
      _themeMode = ThemeMode.light;
    else _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}