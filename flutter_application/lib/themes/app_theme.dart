import 'package:flutter/material.dart';
import 'custom_colors.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: kPrimarySwatch,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black87),
    titleMedium: TextStyle(fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimarySwatch,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kInputFillColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: kPrimarySwatch).copyWith(
    secondary: kSecondaryColor,
  ),
);