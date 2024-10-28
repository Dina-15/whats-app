import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';

class ChatFloatingActionButton extends StatelessWidget {
  const ChatFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.message,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
