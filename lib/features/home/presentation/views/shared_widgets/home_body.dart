import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubits/logout_cubit/logout_cubit.dart';

class HomeBody extends StatelessWidget {
  final dynamic isLoading;

  const HomeBody(this.isLoading, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome In..",
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  context.read<LogoutCubit>().logoutUser();
                },
                child: const Row(
                  children: [
                    Text(
                      "   Logout  ",
                      style: TextStyle(fontSize: 25),
                    ),
                    Icon(Icons.logout)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
