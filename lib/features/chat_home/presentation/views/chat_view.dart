import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.room_id, required this.userModel});
  final String room_id;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
               titleSpacing: 2,
               centerTitle: false,
              title:   ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal:0),
              
              leading:
                  CircleAvatar(radius:20,),              
              subtitleTextStyle: TextStyle(fontSize: 10,color: Colors.black),
              title: Text(userModel.name!),
              subtitle: Text(DateFormat.yMMMEd().format( DateTime.fromMillisecondsSinceEpoch(int.parse(userModel.lastActivate!))).toString()),),

         actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined)),
                  
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],     
      ),
      body: ChatViewBody(room_id: room_id,userModel:userModel));
  }
}