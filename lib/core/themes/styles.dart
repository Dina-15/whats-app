import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

abstract class Styles{
  static TextStyle textStyle24 = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 24
  );
  static TextStyle textStyle15 = const TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorApp.primaryColor,
    fontSize: 15
  );
}