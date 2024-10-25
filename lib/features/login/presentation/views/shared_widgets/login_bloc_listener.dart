import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/routing/routes.dart';
import 'package:mentoracademyproject/core/utils/extensions/context_extension.dart';
import 'package:mentoracademyproject/features/login/presentation/views/shared_widgets/login_body.dart';

import '../../view_model/cubits/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  LoginBlocListener(this.isLoading, {super.key});
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>
      (listener: (context, state) {
      if (state is LoginLoading) {
        isLoading = true;
      } else if (state is LoginSuccess) {
        isLoading = false;
        context.showSnackBar('User Logged In Successfully!');
        Navigator.pushNamed(context, Routes.homeScreen);
      } else if (state is LoginFailure) {
        isLoading = false;
        context.showSnackBar(state.message);
      }
    },
      child: LoginBody(isLoading),
    );
  }
}
