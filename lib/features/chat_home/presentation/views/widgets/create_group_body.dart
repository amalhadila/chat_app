import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/bottom_bar.dart';

class CreateGroupBody extends StatefulWidget {
   CreateGroupBody({super.key});

  @override
  State<CreateGroupBody> createState() => _CreateGroupBodyState();
}

class _CreateGroupBodyState extends State<CreateGroupBody> {
List members=[];
 TextEditingController _groupController = TextEditingController();

   String  group_text='';

  @override
 Widget build(BuildContext context) {

                    final myid = FirebaseAuth.instance.currentUser!.uid;
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
     
        actions: [
          IconButton(onPressed: () async{
           await FirebaseChat().creategroup(group_text, members); 
           Navigator.push(context, MaterialPageRoute(builder:(context) => const BottomBar()));  
          }, icon: Icon(Icons.done))
        ],
      ),
                    body:  Column(
                      children: [
                        ListTile(
                        
           leading: GestureDetector(
            onTap: (){
              
            },
             child: Stack(
              clipBehavior: Clip.none,
              children:[ CircleAvatar(
              radius: 30,             
              ),
              Positioned(
                bottom: 0, 
                left: 36.5,
                 child: Center(
                     child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                       
                        borderRadius: BorderRadius.circular(300)
                      ),
                      child: const Icon(Icons.add,size: 14,color: ColorApp.primaryColor,)),
                   
                 ),
               ),]
                       ),
           ),
            title:TextField(
                onChanged: (value) {
                  setState(() {
                    group_text=value;
                   
                  });
                },
                  controller: _groupController,
                  style: Styles.textStyle18.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Group Name',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    border: InputBorder.none,
                  ),
                ),
          
        
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
                                    bool  is_checked=  members.contains(users.id);
                                          return ListTile(
                                            tileColor:is_checked==true? const Color.fromARGB(55, 189, 189, 189):Colors.white,
                                            
                                            onLongPress: ()async{
                                              setState(() {
                                                
                                             
                                                    if (is_checked) {
                                      members.remove(users.id); 
                                     
                                    } else {
                                      members.add(users.id!);
                                      
                                    } });
                                                   
                                             
                                            },
                                          contentPadding: const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 16),
                                          leading: CircleAvatar(
                                            radius: 30,
                                          ),
                                          title: Text(users.name!),
                                          subtitle: Text(users.phone!.toString()),
                                        );}else{
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
                      ],
                    ));
            }
}
  