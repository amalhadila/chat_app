import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_chat/features/chat_home/data/models/message_model.dart';
import 'package:new_chat/features/chat_home/data/models/room_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseChat {
  final FirebaseFirestore   firebasestorage = FirebaseFirestore.instance;
  final String my_id= FirebaseAuth.instance.currentUser!.uid;
   
 Future createroom(String email)async{
    QuerySnapshot user_email=await firebasestorage.collection('users').where('email',isEqualTo: email).get();
    if (user_email.docs.isNotEmpty) {
    String user_id=user_email.docs.first.id;
    List<String> members=[my_id,user_id]..sort((a, b) => a.compareTo(b),);
    QuerySnapshot room_exist= await firebasestorage.collection('rooms').where('members',isEqualTo: members).get();
     
  if (room_exist.docs.isEmpty) {
    RoomModel chatroom =RoomModel(
      id: members.toString(),
     members: [my_id,user_id],
     createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
     lastmessage:'',
     lastmessagetime: DateTime.now().millisecondsSinceEpoch.toString(),
   );
  await  firebasestorage.collection('rooms').doc(members.toString()).set(chatroom.toMap());
  }
}
  }

 Future sendmessage(String uid,String message,String room_id) async{
    String message_id=Uuid().v1();
    MessageModel messageModel=MessageModel(
      id:message_id,
     fromid: my_id,
      toid: uid, 
           messsage: message,
      messsagetime: DateTime.now().millisecondsSinceEpoch.toString(),
      type: 'text', 
           read: '');

    await   firebasestorage.collection('rooms').doc(room_id).collection('messages').doc(message_id).set(messageModel.toMap());     
  }
}