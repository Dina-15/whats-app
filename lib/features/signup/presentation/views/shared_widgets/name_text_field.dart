import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/helpers/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/shared_widgets/app_text_form_field.dart';

import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});


  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Name',
      labelText: 'Name',
      prefixIcon: Icon(Icons.person, size: 28.r,),
      controller: context.read<SignUpCubit>().nameController,
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isNameValid(value)) {
          return "please, enter a valid name!";
        } else {
          return null;
        }
      },
      enabledRadius: 30,
      errorRadius: 30,
      keyboardType: TextInputType.name,
      fillColor: Colors.white,
      radius: 12,
    );
  }
}
