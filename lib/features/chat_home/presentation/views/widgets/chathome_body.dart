import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/data/models/room_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chathome_list_item.dart';

class ChathomeBody extends StatelessWidget {
  const ChathomeBody({super.key,  this.search_text});
final String? search_text;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[         
         const SizedBox(height: 1,child: Divider(color: Color.fromARGB(255, 0, 0, 0),thickness: .15,)),         
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('rooms')
          .where('members',arrayContains: FirebaseAuth.instance.currentUser!.uid)
         .snapshots(),
         
          builder: (context, snapshot) {
            if (snapshot.hasData) {
               final List<RoomModel> rooms = snapshot.data!.docs.map((e)=>RoomModel.fromMap(e.data())).toList();
              rooms.sort((a, b) {
                return b.lastmessagetime!.compareTo(a.lastmessagetime!); 
              });
  return Expanded(
  child: ListView.builder(
    itemCount: rooms.length,
    itemBuilder: (context, index) {
      return  ChathomeListItem(lastmessagetime: rooms[index].lastmessagetime!,members: rooms[index].members!,name: rooms[index].id!, subtitle: rooms[index].lastmessage!, date: rooms[index].lastmessagetime!,room_id: rooms[index].id!,);
      
    },
  
  ),
        );
}else{
  return SizedBox();
}
          }
        ),]
    );
  }
}