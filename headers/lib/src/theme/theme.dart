import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;


  ThemeChanger(int theme){
    switch(theme){
      case 1: //ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
        );
        break;
      case 3: //dark
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  ThemeData get currentTheme => this._currentTheme;

  bool get darkTheme => this._darkTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if(value){
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
      );
    }else{
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  bool get customTheme => this._customTheme;

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if(value){
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48a0eb),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202b),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white)
        )
      );
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}