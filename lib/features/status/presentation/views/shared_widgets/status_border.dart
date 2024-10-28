import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusBorder extends StatelessWidget {
  const StatusBorder({super.key, required this.borderColor, });
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,// AppColors.primaryColor
          width: 3,
        ),
      ),
    );
  }
}
