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
                            "Login",
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
                              onSaved: (input) {email = input;},
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                  ),
                                  hintText: "Email Adress",
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
                            onSaved: (input) {password = input;},
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
                                 await context.read<LoginCubit>().loginUser(email: email, password: password);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                WidgetStateProperty.all(Colors.black45),
                              ),
                              child: const Text(
                                "login",
                                style: TextStyle(fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Text("Already have an Account? ", style: TextStyle(fontSize: 20)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                  return SignUpScreen();
                                }));
                              },
                              child: Text(" Sign Up", style: TextStyle(color:
                          Colors.white, fontSize: 25),))
                        ],
                      ))),
            ],
          ),
        ),
      ),)
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

