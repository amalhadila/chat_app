import 'package:flutter/material.dart';
import 'package:new_chat/features/profile/presentation/views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:const Text( 'Profile'),
      ),
      body: const ProfileBody(),
    );
  }
}