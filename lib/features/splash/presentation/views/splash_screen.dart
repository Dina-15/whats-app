import 'package:flutter/material.dart';
import 'package:mentoracademyproject/features/splash/presentation/views/widgets/splash_body.dart';
import '../../../auth/presentation/views/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLoginScreen();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
  navigateToLoginScreen(){
  Future.delayed(const Duration(seconds: 3), (){
  Navigator.pushNamed(context, LoginScreen.id);
  });
}
}