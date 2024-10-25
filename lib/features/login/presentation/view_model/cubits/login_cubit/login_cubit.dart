import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> emitLoginStates() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text,
          password: passwordController.text);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(message: "User not found!"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(message: "Wrong Password!"));
      } else {
        emit(LoginFailure(message: "Oops! $e"));
      }
    } on Exception catch (e) {
      emit(LoginFailure(message: 'Something went wrong! $e'));
    }
  }
}
