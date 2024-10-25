import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

class AppStyles {
  static TextStyle font28DarkBlackBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle font24Green = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static TextStyle font14LightGray = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGrey,
  );
  static TextStyle font16DarkGreenRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor,
  );
  static TextStyle font18WhiteRegular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
