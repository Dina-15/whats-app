import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

class AddIconBadge extends StatelessWidget {
  const AddIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Badge(
      label: Icon(
        Icons.add,
        color: Colors.white,
        size: 22,
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
