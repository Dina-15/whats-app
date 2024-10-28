import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_icon_badge.dart';

class ModIconBadge extends StatelessWidget {
  const ModIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppIconBadge(
      icon: Icon(
        Icons.mode,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
