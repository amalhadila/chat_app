import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/data/models/group_model.dart';
import 'package:new_chat/features/chat_home/data/models/message_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/group_chat_view.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({super.key,required this.lastmessagetime, required this.name, required this.subtitle, required this.date,  required this.room_id, required this.members, required this.groub});
  final String? name;
  final String? subtitle;
  final String ?date;
    final String room_id;
    final List members;
    final String lastmessagetime;
   final GroupModel groub;

  @override
  Widget build(BuildContext context) {
          
  return ListTile(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder:(context) =>  GroupChatView(
        groub:groub,members: members,group_id: room_id,group_name: name!,)));
    },
    contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal:16),
    
    leading: const CircleAvatar(
     radius: 22,
    ),
    title:Text(name!) ,
    subtitle:Text(subtitle=='' ?'':subtitle!) ,
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(DateFormat.yMMMEd().format( DateTime.fromMillisecondsSinceEpoch(int.parse(date!))).toString()),
        const SizedBox(height: 9,),
        StreamBuilder(
           stream: FirebaseFirestore.instance.collection('groups').doc(room_id).collection('messages').snapshots(),
          builder: (context, snapshot) {
            final  unreadlist=snapshot.data?.docs.map((e)=>MessageModel.fromMap(e.data())).where((element) => element.read =='',).where((element)=>element.fromid != FirebaseAuth.instance.currentUser!.uid)??[];
            return unreadlist!.length !=0? Badge(
              backgroundColor: ColorApp.primaryColor,
              largeSize: 23,
              padding: const EdgeInsets.all(1),
              label:Text(unreadlist.length.toString()),
            ):Text(DateFormat.EEEE().format( DateTime.fromMillisecondsSinceEpoch(int.parse(lastmessagetime))).toString());
          }
        )
      ],
    ),
  );
}
}