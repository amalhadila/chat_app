import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ChatBubble extends StatefulWidget {
  const ChatBubble({super.key,required this.type, required this.messages, required this.isme, required this.messagestime, required this.read, required this.room_id, required this.message_id, required this.toid});
  final String messages; 
  final String messagestime;
  final String type;
  final bool isme;
  final String read;
  final String room_id;
  final String message_id;
  final String toid;


  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  void initState() {
    if(widget.toid==FirebaseAuth.instance.currentUser!.uid){
    FirebaseChat().messageseen(widget.room_id, widget.message_id);}
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return  Align(
      alignment:widget.isme? Alignment.centerRight:Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container( 
                        
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          decoration:  BoxDecoration(
            borderRadius:widget.isme?BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomLeft: Radius.circular(16)): BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            
            color:widget.isme? Color.fromARGB(183, 170, 255, 201):Color.fromARGB(183, 237, 243, 239),
          ),
          child: Column(
            crossAxisAlignment:widget.isme? CrossAxisAlignment.end: CrossAxisAlignment.start,
            children: [
                       widget.type=='image'?  Container(
                        width: MediaQuery.of(context).size.width*.25,
                        height: MediaQuery.of(context).size.height*.35,
                        
                        child:CachedNetworkImage( imageUrl:widget.messages,fit: BoxFit.fill,),
                       ):Text(widget.messages,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),

              SizedBox(
                width: 85,
                child: Column(
                  crossAxisAlignment:widget.isme? CrossAxisAlignment.end: CrossAxisAlignment.start ,
                  children: [
                     Row(
                       mainAxisAlignment:widget.isme? MainAxisAlignment.end: MainAxisAlignment.start ,
                       children: [
                        
                         Align(
                          alignment:widget.isme? Alignment.bottomRight:Alignment.bottomLeft,
                          child: Text(
                            textAlign: widget.isme? TextAlign.right:TextAlign.left,
                            
                            DateFormat.EEEE().format( DateTime.fromMillisecondsSinceEpoch(int.parse(widget.messagestime))).toString() ,style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 65, 63, 63)),)),
                            SizedBox(width:widget.isme==true? 2:0,),
                           widget.isme==true? Icon(Icons.done_all_outlined,size: 16,color:widget.read==''? Color.fromARGB(255, 65, 63, 63):Colors.blue):SizedBox(),
                       ],
                     ),
                
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}