
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ToggleTheme extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  ToggleTheme(bool themeDark){
    if(themeDark) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if(_currentTheme == ThemeData.light()){
      _currentTheme = ThemeData.dark();
      sharedPreferences.setBool('theme_dark', true);
    }else {
      _currentTheme = ThemeData.light();
      sharedPreferences.setBool('theme_dark', false);
    }
    notifyListeners();
  }
}