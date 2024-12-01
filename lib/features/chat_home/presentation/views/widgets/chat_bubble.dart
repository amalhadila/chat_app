import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messages, required this.isme, required this.messagestime});
  final String messages; 
  final String messagestime;
  final bool isme;
 
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment:isme? Alignment.centerRight:Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container( 
                        
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          decoration:  BoxDecoration(
            borderRadius:isme?BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomLeft: Radius.circular(16)): BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            
            color:isme? Color.fromARGB(183, 170, 255, 201):Color.fromARGB(183, 237, 243, 239),
          ),
          child: Column(
            crossAxisAlignment:isme? CrossAxisAlignment.end: CrossAxisAlignment.start,
            children: [
                                  Text(messages,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),

              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment:isme? CrossAxisAlignment.end: CrossAxisAlignment.start ,
                  children: [
                     Align(
                      alignment:isme? Alignment.bottomRight:Alignment.bottomLeft,
                      child: Text(
                        textAlign: isme? TextAlign.right:TextAlign.left,
                        
                        DateFormat.EEEE().format( DateTime.fromMillisecondsSinceEpoch(int.parse(messagestime))).toString() ,style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 65, 63, 63)),)),
                
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