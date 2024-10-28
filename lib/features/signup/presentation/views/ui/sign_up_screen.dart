import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../view_model/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../shared_widgets/sign_up_bloc_listener.dart';

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
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: SignUpBlocListener(isLoading),
        ),
      ),
    );
  }
}