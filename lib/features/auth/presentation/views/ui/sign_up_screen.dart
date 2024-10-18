import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/utils/extensions/context_extension.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../../../home/presentation/views/ui/home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static String id = "SignUpScreen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _key = GlobalKey();
  bool hidePassword = true;
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) async {
        if (state is LoadingState) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          await context.read<SignUpCubit>().createUser(email: email, password: password);
        } else if (state is createUserSuccess) {
          context.showSnackBar('User Registered Successfully!');
          isLoading = false;
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return HomeScreen();
          }));
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
      builder: (context, state)=>ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(),
      ),
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

