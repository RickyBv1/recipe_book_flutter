import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.indigo.shade500,
    secondary: Colors.grey.shade800,
    surfaceContainer: Colors.grey.shade100,
    tertiary: Colors.indigo.shade500,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.indigo.shade800,
    secondary: Colors.grey.shade800,
    surfaceContainer: Colors.grey.shade800,
    tertiary: Colors.white,
  ),
);
