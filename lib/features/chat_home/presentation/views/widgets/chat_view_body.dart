import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/data/models/message_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chat_bubble.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/textfield_message.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key, required this.room_id, required this.userModel});
  final String room_id;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        
         StreamBuilder(
           stream: FirebaseFirestore.instance.collection('rooms').doc(room_id).collection('messages').snapshots(),
           builder: (context, snapshot) {
             if (snapshot.hasData) {
              List<MessageModel> messages=snapshot.data!.docs.map((toElement)=> MessageModel.fromMap(toElement.data())).toList();
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ChatBubble(messages: messages[index].messsage!,);
                },),
              );
            }else{
              return SizedBox();
            }
           }
         ),
          TextfieldMessage(room_id: room_id,userModel: userModel,),
    ],);
  }
}