import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/data/models/group_model.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/group_details_body.dart';

class GroupDetailsView extends StatelessWidget {
  const GroupDetailsView({super.key,required this.groub});
  final GroupModel groub;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
                   backgroundColor: Colors.white,

                           
                 
                  title: Text(groub.name!),
                  

         actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined)),
                  
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],     
      ),
      body:  GroupDetailsBody(groub:groub));
  }
}