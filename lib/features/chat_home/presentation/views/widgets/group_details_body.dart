import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/data/models/group_model.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';

class GroupDetailsBody extends StatelessWidget {
  const GroupDetailsBody({super.key,  required this.groub});
  final GroupModel groub;

  @override
  Widget build(BuildContext context) {
    bool is_admin=groub.admins!.contains(FirebaseAuth.instance.currentUser!.uid);
        final myid = FirebaseAuth.instance.currentUser!.uid;
   List members=[];
    return !is_admin? ListView.builder(
      itemCount:groub.members!.length ,
      itemBuilder: (context,index) {

        return StreamBuilder(
          stream:FirebaseFirestore.instance.collection('users').doc( groub.members![index]).snapshots(),
    
          builder: (context, snapshot) {
            
            UserModel? users;
             if (snapshot.hasData) {
               users=UserModel.fromMap(snapshot.data!.data()!);
                    bool admin=groub.admins!.contains(users.id);     
            return ListTile(
              leading: CircleAvatar(),
              title:Text(users.name!) ,
              subtitle:admin? Text('Admin'):SizedBox() ,
              trailing:(is_admin && !admin)? SizedBox(
                width: 90,
                child: Row(
                
                  children: [
                  IconButton(onPressed: () async{
                   await FirebaseChat().edit_group(id:groub.id!,  admins:[users!.id!]);
                   Fluttertoast.showToast(msg: '${users.name} is admin know');

                  }, icon: Icon(Icons.person_add,size: 18,)),
                  IconButton(onPressed: ()async{
                       await FirebaseChat().remove_member(id:groub.id!,  members:[users!.id!]);
                     Fluttertoast.showToast(msg: '${users.name} is removed');
                  }, icon: Icon(Icons.delete_outline,size: 18,)),
                ],),
              ):(is_admin &&admin)? SizedBox(
               
                child: 
                  IconButton(onPressed: () async{
                   await FirebaseChat().remove_member(id:groub.id!,  admins:[users!.id!]);
                   Fluttertoast.showToast(msg: '${users.name} is not admin know');

                  }, icon: Icon(Icons.person_remove_rounded,size: 18,)),
            ): SizedBox());}else{
              return SizedBox();
            }
          }
        );
      }
    ):

     Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
     
       children: [
        Expanded(
          child: ListView.builder(
                itemCount:groub.members!.length ,
                itemBuilder: (context,index) {
          
          return StreamBuilder(
            stream:FirebaseFirestore.instance.collection('users').doc( groub.members![index]).snapshots(),
              
            builder: (context, snapshot) {
              
              UserModel? users;
               if (snapshot.hasData) {
                 users=UserModel.fromMap(snapshot.data!.data()!);
                      bool admin=groub.admins!.contains(users.id);     
              return ListTile(
                leading: CircleAvatar(),
                title:Text(users.name!) ,
                subtitle:admin? Text('Admin'):SizedBox() ,
                trailing:(is_admin && !admin)? SizedBox(
                  width: 90,
                  child: Row(
                  
                    children: [
                    IconButton(onPressed: () async{
                     await FirebaseChat().edit_group(id:groub.id!,  admins:[users!.id!]);
                     Fluttertoast.showToast(msg: '${users.name} is admin know');
          
                    }, icon: Icon(Icons.person_add,size: 18,)),
                    IconButton(onPressed: ()async{
                       await FirebaseChat().remove_member(id:groub.id!,  members:[users!.id!]);
                     Fluttertoast.showToast(msg: '${users.name} is removed');
                    }, icon: Icon(Icons.delete_outline,size: 18,)),
                  ],),
                ): (is_admin &&admin)? SizedBox(
               
                child: 
                  IconButton(onPressed: () async{
                   await FirebaseChat().remove_member(id:groub.id!,  admins:[users!.id!]);
                   Fluttertoast.showToast(msg: '${users.name} is not admin know');

                  }, icon: Icon(Icons.person_remove_rounded,size: 18,)),
            ): SizedBox());}else{
                return SizedBox();
              }
            }
          );
                }
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('add members'),
        ),
         StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(myid)
                                  .snapshots(),
                              builder: (context, userSnapshot) {
                                if (userSnapshot.hasData ) {
                                  UserModel userModel =
                                      UserModel.fromMap(userSnapshot.data!.data()!);
                                  if (userModel.contacts != null 
                                     ) {
                                    return  Expanded(
                                      child: ListView.builder(
                                            itemCount:userModel.contacts!.length ,
                                            itemBuilder:(context,index){
                                            return  StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                                                    .collection('users').doc(userModel.contacts![index]).snapshots(),
                                        builder: (context, snapshot) {
                                          
                                              if (snapshot.hasData &&  UserModel.fromMap(snapshot.data!.data()!).email != userModel.email ) {
                                                UserModel users =
                                        UserModel.fromMap(snapshot.data!.data()!);
                                              return  !groub.members!.contains(users.id)?  ListTile(
                                                    
                                                 trailing:  IconButton(onPressed: () async{
                   await FirebaseChat().edit_group(id:groub.id!,  members:[users!.id!]);
                   Fluttertoast.showToast(msg: '${users.name} is added');

                  }, icon: Icon(Icons.person_add,size: 18,)),
                                               
                                             
                                              leading: CircleAvatar(
                                                radius: 30,
                                              ),
                                              title: Text(users.name!),
                                              subtitle: Text(users.phone!.toString()),
                                            ):SizedBox();}else{
                                      return Container();
                                                                    }}
                                          );
                                        }
                                      ),
                                    );
                                  }else{
                                    return Container();
                                  } 
                                         }else{
                                    return Container();
                                  }}),

                                  Spacer()
       ],
     );
  }
}