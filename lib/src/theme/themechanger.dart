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
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;
      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
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
      this._currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
    } else {
      this._currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    this.darkTheme = false;
    this._customTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xff48A0EB),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
          // appTheme.textTheme.bodyText1.color:
          );
    } else {
      this._currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
