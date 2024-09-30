import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/auth/presentation/views/ui/login_screen.dart';
import 'features/auth/presentation/views/ui/sign_up_screen.dart';
import 'features/home/presentation/views/ui/home_screen.dart';
import 'features/splash/presentation/views/splash_screen.dart';
import 'features/auth/presentation/view_model/cubits/login_cubit/login_cubit.dart';
import 'features/auth/presentation/view_model/cubits/logout_cubit/logout_cubit.dart';
import 'features/auth/presentation/view_model/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'features/auth/data/repo/firebase_options.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          textTheme: GoogleFonts.interTextTheme(),
        ),
        routes: {
          LoginScreen.id: (context)=> LoginScreen(),
          SignUpScreen.id: (context)=> SignUpScreen(),
          HomeScreen.id:(context)=>  HomeScreen(),
          SplashScreen.id: (context)=> const SplashScreen(),
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}