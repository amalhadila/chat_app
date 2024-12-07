import 'dart:typed_data';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseStorage {
  Future sendimage(String ext,Uint8List file,String user_id,String myid,String room_id) async {
    String image_id=Uuid().v1();
 await  Supabase.instance.client.storage.from('chat images')
  .uploadBinary('$user_id$myid/$image_id.$ext', file);
 

      String publicUrl = Supabase.instance.client.storage.from('chat images').getPublicUrl('$user_id$myid/$image_id.$ext');
       FirebaseChat().sendmessage(uid: user_id, room_id: room_id,message:publicUrl,type: 'image' );

      
  }
  }
