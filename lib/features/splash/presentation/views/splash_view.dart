import 'package:flutter/material.dart';
import 'package:new_chat/features/splash/presentation/views/widgets/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:SplashViewmodel() ,
    );
  }
}