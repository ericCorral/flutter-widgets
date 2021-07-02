import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: // Custom
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    this._customTheme = false;
    this._darkTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark();
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    this.darkTheme = false;
    this._customTheme = value;

    if (value) {
      this._currentTheme = ThemeData.light();
    } else {
      this._currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
