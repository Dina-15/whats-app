import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/core/utils/extensions/context_extension.dart';
import 'package:mentoracademyproject/features/auth/presentation/view_model/cubits/logout_cubit/logout_cubit.dart';
import 'package:mentoracademyproject/features/auth/presentation/views/ui/login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String id = "HomeScreen";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LogoutCubit,LogoutStates>(
      listener: (context, state){
        if(state is LogoutLoading) {
          isLoading = true;
        } else if(state is LogoutSuccess) {
          isLoading = false;
          context.showSnackBar('User Logged out Successfully!');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        } else if(state is LogoutFailure) {
          isLoading = false;
          context.showSnackBar(state.message);
        }
      },
      builder:(context, state) =>ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome In..", style: TextStyle(fontSize: 40),),
              const SizedBox(height: 30,),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(onPressed: (){
                  context.read<LogoutCubit>().logoutUser();
                }, child: Row(
                  children: [
                    const Text("   Logout  ", style: TextStyle(fontSize: 25),),
                    Icon(Icons.logout)
                  ],
                )),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
