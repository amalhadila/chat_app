import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/bottom_bar.dart';
import 'package:new_chat/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
                
       
      ),
      home: SplashView(),
    );
  }
}
