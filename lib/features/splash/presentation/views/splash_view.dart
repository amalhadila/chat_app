import 'package:flutter/material.dart';
import 'package:new_chat/features/splash/presentation/views_model/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(body:  const SplashViewmodel(),);
    
  }
}