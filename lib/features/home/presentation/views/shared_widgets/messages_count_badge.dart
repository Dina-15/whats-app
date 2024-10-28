import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';

class MessagesCountBadge extends StatelessWidget {
  MessagesCountBadge({super.key, required this.count});

  int? count;
  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: count != null,
      label: Text('$count',
          style: AppStyles.font18Black
              .copyWith(fontSize: 18, color: Colors.white)),
      backgroundColor: AppColors.primaryColor,
    );
  }
}