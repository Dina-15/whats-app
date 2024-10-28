import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

class AppIconBadge extends StatelessWidget {
  const AppIconBadge({super.key, required this.icon});

  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Badge(
      label: icon,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
