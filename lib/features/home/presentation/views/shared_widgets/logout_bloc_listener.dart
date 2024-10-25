import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/routing/routes.dart';
import 'package:mentoracademyproject/core/utils/extensions/context_extension.dart';
import 'package:mentoracademyproject/features/home/presentation/views/shared_widgets/home_body.dart';

import '../../../../login/presentation/views/ui/login_screen.dart';
import '../../view_model/cubits/logout_cubit/logout_cubit.dart';

class LogoutBlocListener extends StatelessWidget {
  LogoutBlocListener(this.isLoading, {super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit,LogoutStates>(
        listener: (context, state){
      if(state is LogoutLoading) {
        isLoading = true;
      } else if(state is LogoutSuccess) {
        isLoading = false;
        context.showSnackBar('User Logged out Successfully!');
        Navigator.pushNamed(context, Routes.loginScreen);
      } else if(state is LogoutFailure) {
        isLoading = false;
        context.showSnackBar(state.message);
      }
    },
      child: HomeBody(isLoading),
    );
  }
}
