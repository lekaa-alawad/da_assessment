import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(11, 35, 101, 1);
const Color primaryContainer = Color.fromRGBO(82, 106, 187, 0.8);
const Color secondaryContainer = Colors.grey;
const Color secondary = Color.fromRGBO(98, 113, 156, 1);

final appThemeData = ThemeData(
  appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: secondary), color: primary),
  // Define your color palette
  colorScheme: const ColorScheme.light(
    primary: primary,
    secondary: secondary,
    secondaryContainer: secondaryContainer,
    primaryContainer: primaryContainer,
    background: Colors.white,
  ),

  // Define your text themes
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: secondary,
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: secondary,
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: secondary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: secondaryContainer,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: secondaryContainer,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: secondaryContainer,
    ),
  ),
);
