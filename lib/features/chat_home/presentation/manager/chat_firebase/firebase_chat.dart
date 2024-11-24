import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_chat/features/chat_home/data/room_model.dart';

class FirebaseChat {
  final FirebaseFirestore   firebasestorage = FirebaseFirestore.instance;
  final String my_id= FirebaseAuth.instance.currentUser!.uid;
   
  createroom(String email)async{
    QuerySnapshot user_email=await firebasestorage.collection('users').where('email',isEqualTo: email).get();
    if (user_email.docs.isNotEmpty) {
    String user_id=user_email.docs.first.id;
    List<String> members=[my_id,user_id]..sort((a, b) => a.compareTo(b),);
    QuerySnapshot room_exist= await firebasestorage.collection('rooms').where('members',isEqualTo: members).get();
     
  if (room_exist.docs.isEmpty) {
    RoomModel chatroom =RoomModel(
      id: members.toString(),
     members: [my_id,user_id],
     createdAt: DateTime.now().toString(),
     lastmessage:'',
     lastmessagetime: DateTime.now().toString(),
   );
  await  firebasestorage.collection('rooms').doc(members.toString()).set(chatroom.toMap());
  }
}
  }
}