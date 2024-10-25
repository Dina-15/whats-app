import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:mentoracademyproject/core/routing/routes.dart';
import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';

class ToggleToSignUp extends StatelessWidget {
  const ToggleToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Don’t have an account? ",
            style: AppStyles.font16DarkGreyRegular.copyWith(color: AppColors.darkGrey)),
        TextSpan(
            text: " Join us",
            style: AppStyles.font16DarkGreyRegular.copyWith(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.signUpScreen);
              }),
      ]),
    );
  }
}
