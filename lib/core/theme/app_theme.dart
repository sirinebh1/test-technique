import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Raleway',
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: AppColors.secondary,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textLight,
      fontSize: 14,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: AppColors.textLight),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
);
