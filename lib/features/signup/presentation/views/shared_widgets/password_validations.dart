import 'package:mentoracademyproject/core/themes/colors.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:flutter/material.dart';

import 'package:mentoracademyproject/core/helpers/spacing.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        verticalSpace(6),
        validationLine('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        validationLine('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        validationLine('At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        validationLine('At least 1 number', hasNumber),
        verticalSpace(2),
        validationLine('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget validationLine(String text, bool isValid) {
    return Row(
      children: [
        horizontalSpace(20),
        CircleAvatar(
          radius: 2,
          backgroundColor: AppColors.darkGrey,
        ),
        Text(
          '  $text',
          style: AppStyles.font14LightGray.copyWith(
              decoration: isValid ? TextDecoration.lineThrough : null,
              decorationColor: AppColors.primaryColor,
              decorationThickness: 1,
              color: isValid ? AppColors.lightGrey : AppColors.darkGrey),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
