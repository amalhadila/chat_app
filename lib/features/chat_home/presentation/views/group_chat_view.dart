import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/data/models/group_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/group_details_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/group_chat_body.dart';

class GroupChatView extends StatelessWidget {
  const GroupChatView({super.key, required this.group_id,required this.group_name,required this.members, required this.groub});

  final String group_id;
  final String group_name;
  final List members;
  final GroupModel groub;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.white,
               titleSpacing: 2,
               centerTitle: false,
              title:   StreamBuilder(
               stream: FirebaseFirestore.instance.collection('users')
          .where('id',whereIn: members)
         .snapshots(),
                builder: (context, snapshot) {
                List  members_list=[];
                  if (snapshot.hasData){
                    for (var element in snapshot.data!.docs){
                    members_list.add(element.data()['name']);
                    }
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal:0),
                  
                  leading:
                      CircleAvatar(radius:20,),              
                  subtitleTextStyle: TextStyle(fontSize: 10,color: Colors.black),
                  title: Text(group_name),
                  subtitle: GestureDetector(
                    onTap: (){
                       Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>GroupDetailsView(groub:groub),
          ),);
                    },
                    child: Text(members_list.join(','))),);
                }else{
                  return Container();
                }}
              ),

         actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined)),
                  
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],     
      ),
      body:GroupChatBody(group_id: group_id) ,) ;
  }
}