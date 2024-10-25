import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/helpers/app_regex.dart';

import 'package:mentoracademyproject/core/shared_widgets/app_text_form_field.dart';

import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});


  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
     hintText: 'Email',
     labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email, size: 28,),
      controller: context.read<SignUpCubit>().emailController,
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
          return "please, enter a valid email!";
        } else {
          return null;
        }
      },
      enabledRadius: 30,
      errorRadius: 30,
      fillColor: Colors.white,
      radius: 12,
    );
  }
}