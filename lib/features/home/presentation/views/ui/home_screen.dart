import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoracademyproject/features/home/presentation/views/shared_widgets/logout_bloc_listener.dart';
import '../../view_model/cubits/logout_cubit/logout_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutStates>(
      builder: (context, state) => const LogoutBlocListener()
    );
  }
}
