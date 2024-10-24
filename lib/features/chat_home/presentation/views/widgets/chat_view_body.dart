import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chat_bubble.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/textfield_message.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        
         Expanded(
           child: ListView.builder(
            itemBuilder: (context, index) {
              return ChatBubble();
            },),
         ),
          TextfieldMessage(),
    ],);
  }
}