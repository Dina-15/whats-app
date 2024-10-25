import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';

class LogoutAlertDialog {
  Future ShowLogoutDialog(BuildContext context) async{
    return await showDialog<String>(
      context: context,
      builder:(context) => AlertDialog(
          icon: const Icon(
            Icons.error_outline,
            color: AppColors.primaryColor,
            size: 70,
          ),
          content: Text(
            "Do you want to logout?",
            style: AppStyles.font28DarkBlackBold.copyWith(fontSize: 24)
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop("true");
              },
              child: Text(
                'LogOut',
                style: AppStyles.font18Black.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop("false");
              },
              child: Text(
                'Cancel',
                style: AppStyles.font18Black.copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
      ),
    );
  }
}
