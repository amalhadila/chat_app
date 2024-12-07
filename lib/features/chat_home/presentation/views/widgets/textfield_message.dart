import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/supabase_storage.dart';

class TextfieldMessage extends StatefulWidget {
  TextfieldMessage({super.key, required this.room_id, required this.userModel});

  @override
  final String room_id;
  final UserModel userModel;

  @override
  State<TextfieldMessage> createState() => _TextfieldMessageState();
}

class _TextfieldMessageState extends State<TextfieldMessage> {
  String? message;
  final TextEditingController _messageController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController, 
                onChanged: (value) {
                  message = value;
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.emoji_emotions_outlined),
                  ),
                  suffixIcon: SizedBox(
                    width: 98,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async{
                            XFile? gallery_image=await ImagePicker().pickImage(source: ImageSource.gallery);
                            if( gallery_image !=null){
                              String ext=gallery_image.path.split('.').last;
                            final image = await gallery_image.readAsBytes();
                             SupabaseStorage().sendimage(ext, image, widget.userModel.id!,FirebaseAuth.instance.currentUser!.uid,widget.room_id);
                            }
                          },
                          
                          icon: Icon(Icons.attach_file),
                        ),
                        IconButton(
                          onPressed: ()  async{
                            XFile? camera_image=await ImagePicker().pickImage(source: ImageSource.camera);
                            if( camera_image !=null){
                              String ext=camera_image.path.split('.').last;
                            final image = await camera_image.readAsBytes();
                             SupabaseStorage().sendimage(ext, image, widget.userModel.id!,FirebaseAuth.instance.currentUser!.uid,widget.room_id);
                            }},
                          icon: Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: ColorApp.primaryColor,
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    if (message != null && message!.trim().isNotEmpty) {
                      await FirebaseChat()
                          .sendmessage(uid:widget.userModel.id!, message:message!, room_id:widget.room_id)
                          .then((onValue) {
                        setState(() {
                          message = '';
                          _messageController.clear(); 
                        });
                      });
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
