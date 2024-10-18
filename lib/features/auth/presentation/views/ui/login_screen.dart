import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/utils/extensions/context_extension.dart';
import 'package:mentoracademyproject/features/auth/presentation/view_model/cubits/login_cubit/login_cubit.dart';
import 'package:mentoracademyproject/features/auth/presentation/views/ui/sign_up_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../home/presentation/views/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = "LoginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _key = GlobalKey();
  bool hidePassword = true;
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state){
        if(state is LoginLoading) {
          isLoading = true;
        } else if(state is LoginSuccess) {
          isLoading = false;
          context.showSnackBar('User Logged In Successfully!');
          Navigator.of(context).push(MaterialPageRoute(builder: (builder){
            return HomeScreen();
          }));
        } else if(state is LoginFailure) {
          isLoading = false;
          context.showSnackBar(state.message);
        }
      },
      builder: (context, state)=>ModalProgressHUD(
      inAsyncCall: isLoading,
         child: Scaffold()
     )
    );
  }
  bool validateAndSave() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

