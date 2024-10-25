import 'package:mentoracademyproject/core/routing/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';

class ToggleToLogin extends StatelessWidget {
  const ToggleToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: "Have an account? ", style: AppStyles.font16DarkGreenRegular.copyWith(color: AppColors.darkGrey)),
        TextSpan(
            text: " Login",
            style: AppStyles.font16DarkGreenRegular.copyWith(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, Routes.loginScreen);
              })
      ]),
    );
  }
}
