import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/routing/routes.dart';
import 'package:mentoracademyproject/core/utils/extensions/context_extension.dart';
import 'package:mentoracademyproject/features/signup/presentation/views/shared_widgets/sign_up_body.dart';

import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  SignUpBlocListener(this.isLoading, {super.key});
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
        listener: (context, state) async {
      if (state is LoadingState) {
        isLoading = true;
      } else if (state is SignUpSuccess) {
        await context.read<SignUpCubit>().createUser();
      } else if (state is createUserSuccess) {
        context.showSnackBar('User Registered Successfully!');
        isLoading = false;
        Navigator.pushNamed(context, Routes.homeScreen);
      } else if (state is SignUpFailure) {
        isLoading = false;
        context.showSnackBar(state.message);
      }
      else if(state is createUserFailure)
      {
        isLoading = false;
        context.showSnackBar(state.message);
      }
    },
    child: SignUpBody(isLoading),
    );
  }
}
