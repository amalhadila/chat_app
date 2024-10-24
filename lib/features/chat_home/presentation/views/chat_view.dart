import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
               titleSpacing: 2,
               centerTitle: false,
              title:  const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal:0),
              
              leading:
                  CircleAvatar(radius:20,),              
              subtitleTextStyle: TextStyle(fontSize: 10,color: Colors.black),
              title: Text('name'),
              subtitle: Text('last seen today at 12:00 pm'),),

         actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined)),
                  
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],     
      ),
      body: ChatViewBody());
  }
}