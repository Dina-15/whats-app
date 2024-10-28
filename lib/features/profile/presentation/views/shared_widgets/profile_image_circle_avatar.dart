import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageCircleAvatar extends StatelessWidget {
  const ProfileImageCircleAvatar({super.key, this.imageURL});

  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: imageURL != null
            ? Image.network(
          imageURL!,
          fit: BoxFit.cover,
          height: 200.h,
          width: 200.w,
        )
            : Icon(Icons.account_circle, size: 143.r),
      ),
    );
  }
}