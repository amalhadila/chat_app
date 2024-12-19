import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/data/models/group_model.dart';
import 'package:new_chat/features/chat_home/data/models/message_model.dart';
import 'package:new_chat/features/chat_home/data/models/room_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class FirebaseChat {
  final FirebaseFirestore   firebasestorage = FirebaseFirestore.instance;
  final String my_id= FirebaseAuth.instance.currentUser!.uid;
   
 Future createroom(String email)async{
    QuerySnapshot user_email=await firebasestorage.collection('users').where('email',isEqualTo: email).get();
    if (user_email.docs.isNotEmpty) {
    String user_id=user_email.docs.first.id;
  UserModel user_name = UserModel.fromMap(user_email.docs.first.data() as Map<String, dynamic>);
    List<String> members=[my_id,user_id]..sort((a, b) => a.compareTo(b),);
    QuerySnapshot room_exist= await firebasestorage.collection('rooms').where('members',isEqualTo: members).get();
     
  if (room_exist.docs.isEmpty) {
    RoomModel chatroom =RoomModel(
      id: members.toString(),
      name: user_name.name,
     members: [my_id,user_id],
     createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
     lastmessage:'',
     lastmessagetime: DateTime.now().millisecondsSinceEpoch.toString(),
   );
  await  firebasestorage.collection('rooms').doc(members.toString()).set(chatroom.toMap());
  }
}
  }
 
Future creategroup(String groupName,List members) async{
  String id=Uuid().v1();
  members.add(my_id);
  GroupModel groupModel=GroupModel(
    id: id,
    name: groupName,
    image: '',
    admins: [my_id],
    members:members ,
    createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
    lastmessage:'',
    lastmessagetime: DateTime.now().millisecondsSinceEpoch.toString(),   
   

  );
   await firebasestorage.collection('groups').doc(id).set(groupModel.toMap());  
} 

Future<void> addContacts(List<String> phones) async {
  final Set<String> userIds = {};

  for (int i = 0; i < phones.length; i += 30) {
    final List<String> batch = phones.sublist(
      i,
      i + 30 > phones.length ? phones.length : i + 30,
    );

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', whereIn: batch)
        .get();

    for (var doc in snapshot.docs) {
      userIds.add(doc.id);
    }
  }

  if (userIds.isNotEmpty) {
    await FirebaseFirestore.instance.collection('users').doc(my_id).update({
      'contacts': userIds.toList(),
    });
    print('success');
  } else {
    print('no contacts');
  }
}



 Future sendmessage({required String uid,String? message,required String room_id, String? type}) async{
    String message_id=Uuid().v1();
    MessageModel messageModel=MessageModel(
      id:message_id,
     fromid: my_id,
     
      toid: uid, 
           messsage: message,
      messsagetime: DateTime.now().millisecondsSinceEpoch.toString(),
      type:type?? 'text', 
           read: '');

    await   firebasestorage.collection('rooms').doc(room_id).collection('messages').doc(message_id).set(messageModel.toMap());   
    await firebasestorage.collection('rooms').doc(room_id).update({'lastmessage':message,'lastmessagetime':DateTime.now().millisecondsSinceEpoch.toString()});  
  }
  
  Future messageseen(String room_id,String message_id) async{
    await firebasestorage.collection('rooms').doc(room_id).collection('messages').doc(message_id).update({'read':'true'});
  }

  Future sendGmessage({String? message,required String group_id, String? type}) async{
    String message_id=Uuid().v1();
    MessageModel messageModel=MessageModel(
      id:message_id,
     fromid: my_id,
     
      toid: '', 
           messsage: message,
      messsagetime: DateTime.now().millisecondsSinceEpoch.toString(),
      type:type?? 'text', 
           read: '');

    await   firebasestorage.collection('groups').doc(group_id).collection('messages').doc(message_id).set(messageModel.toMap());   
    await firebasestorage.collection('groups').doc(group_id).update({'lastmessage':message,'lastmessagetime':DateTime.now().millisecondsSinceEpoch.toString()});  
  }
  
 
}