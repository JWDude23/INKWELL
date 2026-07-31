import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      colorSchemeSeed: Colors.blue,
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData.dark(
      useMaterial3: true,
    );
  }
}