import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_text_button.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';
import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'email_text_field.dart';
import 'name_text_field.dart';
import 'password_text_field.dart';
import 'phone_text_field.dart';
import 'toggle_to_login.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody(this.isLoading, {super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(40),
          Image.asset(AppAssets.logo, width: 100.w,
            height: 100.h,),
          verticalSpace(30),
          Text("Create new account",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppStyles.font28DarkBlackBold),
          verticalSpace(30),
          Form(
              key: context.read<SignUpCubit>().formKey,
              child: Column(
                children: [
                  const NameTextField(),
                  verticalSpace(18),
                  const EmailTextField(),
                  verticalSpace(18),
                  const PhoneTextField(),
                  verticalSpace(18),
                  const PasswordTextField(),
                  verticalSpace(18),
                ],
              )),
          verticalSpace(6),
          AppTextButton(
            buttonWidth: 270.w,
            buttonHeight: 42.h,
            buttonText: "Sign up",
            onPressed: () {
              validateThenLogin(context);
            },
          ),
          verticalSpace(20),
          const ToggleToLogin(),
          verticalSpace(20),
        ],
      ),
    );
  }

  validateThenLogin(BuildContext context)
  {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
