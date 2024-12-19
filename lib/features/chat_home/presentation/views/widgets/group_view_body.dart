import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/data/models/group_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chathome_list_item.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/group_list_item.dart';

class GroupViewBody extends StatelessWidget {
  const GroupViewBody({super.key,this.search_text});
final String? search_text;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[         
         const SizedBox(height: 1,child: Divider(color: Color.fromARGB(255, 0, 0, 0),thickness: .15,)),         
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('groups')
          .where('members',arrayContains: FirebaseAuth.instance.currentUser!.uid)
         .snapshots(),
         
          builder: (context, snapshot) {
            if (snapshot.hasData) {
               final List<GroupModel> groub = snapshot.data!.docs.map((e)=>GroupModel.fromMap(e.data())).toList();
               //.where((e)=>e.name!.contains(search_text!)).toList();
              groub.sort((a, b) {
                return b.lastmessagetime!.compareTo(a.lastmessagetime!); 
              });
  return Expanded(
  child: ListView.builder(
    itemCount: groub.length,
    itemBuilder: (context, index) {

      return  GroupListItem(lastmessagetime: groub[index].lastmessagetime!,members: groub[index].members!,name: groub[index].name!, subtitle: groub[index].lastmessage!, date: groub[index].lastmessagetime!,room_id: groub[index].id!,);
      
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