import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_icon_badge.dart';

class ModIconBadge extends StatelessWidget {
  const ModIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconBadge(
      icon: Icon(
        Icons.mode,
        size: 30.r,
        color: Colors.white,
      ),
    );
  }
}
