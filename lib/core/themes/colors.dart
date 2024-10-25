import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final AppColors _instance = AppColors._();
  factory AppColors() => _instance;
  static const primaryColor = Color(0xFF3FBD57);
  static const secondaryColor = Color(0xFF00A984);
  static const bubbleLightGreen = Color(0xFFE7FED8);
  static Color lightGrey = Colors.grey[300]!;
  static Color darkGrey = Colors.grey[700]!;
}