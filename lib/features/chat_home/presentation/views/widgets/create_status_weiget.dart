import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';

class CreateStatusWeiget extends StatelessWidget {
  const CreateStatusWeiget({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListTile(
          leading: Stack(
            clipBehavior: Clip.none,
            children:[ CircleAvatar(
             radius: 30,             
            ),
            Positioned(
              bottom: 0, 
              left: 36.5,
               child: Container(
                 width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorApp.primaryColor,               
                    borderRadius: BorderRadius.circular(300)
                  ),
                 child: Center(
                   child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      color: Colors.white,
                     
                      borderRadius: BorderRadius.circular(300)
                    ),
                    child: const Icon(Icons.add,size: 12,color: ColorApp.primaryColor,)),
                 ),
               ),
             ),]
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),

        );
  }
}