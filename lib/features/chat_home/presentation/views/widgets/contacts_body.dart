import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_view.dart';

class ContactsBody extends StatelessWidget {
  const ContactsBody({super.key, required this.contacts});
  final List<Contact?> contacts;

  @override
  Widget build(BuildContext context) {

                    final myid = FirebaseAuth.instance.currentUser!.uid;
                  return StreamBuilder(
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
                            return  ListView.builder(
                                  itemCount:userModel.contacts!.length ,
                                  itemBuilder:(context,index){
                                  return  StreamBuilder(
                              stream: FirebaseFirestore.instance
                          .collection('users').doc(userModel.contacts![index]).snapshots(),
                              builder: (context, snapshot) {
                                
                                    if (snapshot.hasData &&  UserModel.fromMap(snapshot.data!.data()!).email != userModel.email ) {
                                      UserModel users =
                              UserModel.fromMap(snapshot.data!.data()!);
                                    return ListTile(
                                      onTap: ()async{
                                            List<String> members=[myid,users.id!]..sort((a, b) => a.compareTo(b),);

                                       await FirebaseChat().createroom(users.email!);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatView(userModel:users ,room_id: members.toString()
                                , ),
                                          ),
                                        );
                                       
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
                            );
                          }else{
                            return Container();
                          } 
             }else{
                            return Container();
                          }});
            }
          }
  