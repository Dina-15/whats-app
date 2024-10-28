import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_text_button.dart';
import 'package:mentoracademyproject/core/themes/styles.dart';
import 'package:mentoracademyproject/core/utils/constants/app_assets.dart';
import '../../view_model/cubits/login_cubit/login_cubit.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';
import 'toggle_to_sign_up.dart';

class LoginBody extends StatelessWidget {
   LoginBody(this.isLoading, {super.key});

   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          verticalSpace(80),
          Image.asset(AppAssets.logo, width: 100.w,height: 100.h,),
          verticalSpace(30),
          Text("Login to your account", style: AppStyles.font28DarkBlackBold),
          verticalSpace(30),
          Form(
            key: context.read<LoginCubit>().formKey,
            //! then this key will be called from cubit
            child: Column(
              children: [
                const EmailTextField(),
                verticalSpace(18),
                const PasswordTextField(),
              ],
            ),
          ),
          verticalSpace(30),
          AppTextButton(
            buttonWidth: 270.w,
            buttonHeight: 42.h,
            buttonText: "Login",
            onPressed: () {
              validateThenLogin(context);
            },
          ),
          verticalSpace(15),
          const ToggleToSignUp(),
          verticalSpace(20),
        ],
      ),
    );
  }

  validateThenLogin(BuildContext context)
  {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}