import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(bool isDarkmode) => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
      );
}
