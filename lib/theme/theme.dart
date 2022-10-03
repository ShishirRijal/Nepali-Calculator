import 'package:flutter/material.dart';
import 'package:nepali_calculator/constants.dart';

class CalculatorTheme with ChangeNotifier {
  ThemeData _theme = light();
  ThemeData get theme {
    return _theme;
  }

  // void setMode(newTheme) {
  //   _theme = newTheme;
  //   notifyListeners();
  // }

  void switchMode(bool setDark) {
    _theme = setDark == true ? dark() : light();
    notifyListeners();
  }

  bool get isDark {
    return _theme == dark();
  }

  static TextTheme? lightTextTheme = const TextTheme(
    headline1: TextStyle(
      fontSize: 50.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    headline1: TextStyle(
      fontSize: 50.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );

  // getter
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      textTheme: lightTextTheme,
      canvasColor: Colors.white,
      backgroundColor: Colors.white,
      // scaffoldBackgroundColor: ,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
      primaryColor: kPrimaryColor,
      canvasColor: kPrimaryColor,
      backgroundColor: kBackgroundColor,
      // backgroundColor: const Color.fromARGB(255, 8, 32, 51),
    );
  }
}
