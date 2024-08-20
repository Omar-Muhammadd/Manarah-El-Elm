import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
    bodyMedium: ArabicTextStyle(
      arabicFont: ArabicFont.dinNextLTArabic,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
      titleTextStyle: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        fontSize: 15,
        color: Colors.blueAccent,
      ),
  )
);
