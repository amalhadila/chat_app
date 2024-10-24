import 'package:flutter/material.dart';

class CallsItem extends StatelessWidget {
  const CallsItem({super.key, required this.name, required this.date, required this.icon});
    final String name; 
  final String date;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal:16),
      
      leading: CircleAvatar(
        radius: 30,        
      ),
      title:Text(name) ,
      subtitle:Text(date) ,      
       trailing: Icon(icon), 
     
    );
  }
}