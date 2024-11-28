import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messages});
  final String messages; 
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(      
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            color: Color.fromARGB(183, 170, 255, 201)
          ),
          child: Text(messages,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
        ),
      ),
    );
  }
}