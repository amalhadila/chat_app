import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_view.dart';

class ChathomeListItem extends StatelessWidget {
  const ChathomeListItem({super.key, required this.name, required this.subtitle, required this.date, this.unread, required this.room_id, required this.members});
  final String? name;
  final String? subtitle;
  final String ?date;
  final String? unread;
    final String room_id;
    final List members;

  @override
  Widget build(BuildContext context) {
          String user_id=members.where((Element)=> Element != FirebaseAuth.instance.currentUser!.uid).first;

    return  StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').doc(user_id).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel userModel=UserModel.fromMap(snapshot.data!.data()!) ;
  return ListTile(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder:(context) =>  ChatView(room_id: room_id,)));
    },
    contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal:16),
    
    leading: const CircleAvatar(
     radius: 22,
    ),
    title:Text(userModel.name!) ,
    subtitle:Text(subtitle=='' ?userModel.about!:subtitle!) ,
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(date!),
        const SizedBox(height: 9,),
        Badge(
          backgroundColor: ColorApp.primaryColor,
          largeSize: 23,
          padding: const EdgeInsets.all(1),
          label:unread!=null? Text(unread!):null,
        )
      ],
    ),
  );
}else{
        return SizedBox();
      }
      }
    );
  }
}