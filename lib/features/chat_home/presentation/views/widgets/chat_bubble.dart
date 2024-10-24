import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/core/theme/styles.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(      
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            color: const Color.fromARGB(183, 170, 255, 201)
          ),
          child: Text('first message',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
        ),
      ),
    );
  }
}