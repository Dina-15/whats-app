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
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 50, bottom: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black54.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 5),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                                validator: (value) =>
                                value!.isEmpty ? 'This field is required' : null,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(fontSize: 20),
                                onSaved: (input) {email=input;},
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                    ),
                                    hintText: "Email Address",
                                    hintStyle: TextStyle(fontSize: 20))),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) =>
                              value!.isEmpty ? 'This field is required' : null,
                              obscureText: hidePassword,
                              style: const TextStyle(fontSize: 20),
                              keyboardType: TextInputType.text,
                              onSaved: (input) {password=input;},
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(fontSize: 20)),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            SizedBox(
                              height: 45,
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (validateAndSave()) {
                                   await context.read<SignUpCubit>().signUpUser(email: email, password: password);
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStateProperty.all(Colors.black45),
                                ),
                                child: const Text(
                                  "register",
                                  style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40,),
                            Text("Already have an Account? ", style: TextStyle(fontSize: 20),),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                    return LoginScreen();
                                  }));
                                },
                                child: Text(" Login", style: TextStyle(color:
                                Colors.white,fontSize: 25),))
                          ],
                        ))),
              ],
            ),
          ),
        ),
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

