import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({super.key, required this.name, required this.date, this.seen});
   final String name; 
  final String date;
  final bool? seen;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal:16),
      
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: ColorApp.primaryColor,
        child: Center(
          child: CircleAvatar(
            radius: 26,
          backgroundColor: Colors.white,
            child: Center(
              child: const CircleAvatar(
               radius: 24,
              ),
            ),
          ),
        ),
      ),
      title:Text(name) ,
      subtitle:Text(date) ,
      
        
     
    );
  }
}