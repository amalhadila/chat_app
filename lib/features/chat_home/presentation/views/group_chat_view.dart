import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/group_chat_body.dart';

class GroupChatView extends StatelessWidget {
  const GroupChatView({super.key, required this.group_id,required this.group_name});

  final String group_id;
  final String group_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.white,
               titleSpacing: 2,
               centerTitle: false,
              title:   ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal:0),
              
              leading:
                  CircleAvatar(radius:20,),              
              subtitleTextStyle: TextStyle(fontSize: 10,color: Colors.black),
              title: Text(group_name),),

         actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined)),
                  
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],     
      ),
      body:GroupChatBody(group_id: group_id) ,) ;
  }
}