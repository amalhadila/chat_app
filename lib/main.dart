import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/features/splash/presentation/views/splash_view.dart';
import 'package:new_chat/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
await Supabase.initialize(
    url: 'https://xbfzynmubsgpbaxydljx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhiZnp5bm11YnNncGJheHlkbGp4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMzNjIwODIsImV4cCI6MjA0ODkzODA4Mn0.ZC_UU4-wwyup2Zu-OiKyO4VGTGbZjA9mvOOCiD5wpCg',
  );
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
