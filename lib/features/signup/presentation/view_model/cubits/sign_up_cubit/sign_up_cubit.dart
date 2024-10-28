import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> emitSignUpStates() async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(message: "Email is already in use!"));
      } else if (e.code == 'weak-password') {
        emit(SignUpFailure(message: "Weak Password!"));
      }
    } on Exception catch (e) {
      emit(SignUpFailure(message: 'Something went wrong! $e}'));
    }
  }

  Future<void> createUser() async {
    emit(LoadingState());
    try {
      await FirebaseFirestore.instance.collection("users").add({
        'email': emailController.text,
        'password': passwordController.text,
        'user name': nameController.text,
        'user phone': phoneController.text
      });
      emit(createUserSuccess());
    } on FirebaseException catch (e) {
      emit(createUserFailure(message: e.toString()));
    } on Exception catch (e) {
      emit(createUserFailure(message: 'Something went wrong! $e'));
    }
  }
}
