import 'package:flutter/material.dart';
import 'package:minimal_chat/themes/dark_mood.dart';
import 'package:minimal_chat/themes/light_mood.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
