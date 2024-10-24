import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';

class TextfieldMessage extends StatelessWidget {
  const TextfieldMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined),),
                  suffixIcon: SizedBox(width: 98,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.attach_file),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined),),
                    ],),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.black)
                  ) ,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
                
              ),
            ),
             SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: ColorApp.primaryColor,
              child: Center(child: IconButton(onPressed: (){},icon:Icon(Icons.send,color: Colors.white,),))
            )
          ],
        ),
      ),
    );
  }
}