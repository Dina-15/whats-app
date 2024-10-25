import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/features/home/presentation/views/shared_widgets/logout_bloc_listener.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../view_model/cubits/logout_cubit/logout_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String id = "HomeScreen";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutStates>(
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: LogoutBlocListener(isLoading)
        ),
      ),
    );
  }
}
