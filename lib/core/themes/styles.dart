import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

abstract class Styles{
  static TextStyle textStyle24 = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 26
  );
  static TextStyle textStyle20 = const TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorApp.primaryColor,
    fontSize: 20
  );
}