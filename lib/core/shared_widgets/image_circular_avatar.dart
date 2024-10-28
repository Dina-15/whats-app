import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCircularAvatar extends StatelessWidget {
  const ImageCircularAvatar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: 100.h,
          width: 100.w,
        ),),
    );
  }
}
