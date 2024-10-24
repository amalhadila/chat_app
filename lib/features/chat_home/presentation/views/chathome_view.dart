import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chathome_body.dart';

class ChathomeView extends StatelessWidget {
  const ChathomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: ColorApp.primaryColor,
      child:const Icon(Icons.message, color: Colors.white,)),
      body: ChathomeBody(),
    );
  }
}