import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(bool isDarkmode) => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF222347),
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
      );
}
