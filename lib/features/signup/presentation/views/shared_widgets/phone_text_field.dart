import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_text_form_field.dart';

import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Phone',
      labelText: 'Phone',
      prefixIcon: const Icon(Icons.phone_android, size: 28,),
      controller: context.read<SignUpCubit>().phoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please, enter a valid phone number!";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.phone,
      fillColor: Colors.white,
      enabledRadius: 30,
      errorRadius: 30,
      radius: 12,
    );
  }
}
