import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/login_cubit/login_cubit.dart';
import 'cubits/logout_cubit/logout_cubit.dart';
import 'cubits/sign_up_cubit/sign_up_cubit.dart';
import 'firebase_options.dart';

import 'screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=> LoginCubit(),),
        BlocProvider(create: (context)=> SignUpCubit(),),
        BlocProvider(create: (context)=> LogoutCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home:  LoginScreen(),
      ),
    );
  }
}