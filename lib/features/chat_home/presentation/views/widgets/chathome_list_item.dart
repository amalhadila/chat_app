import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_view.dart';

class ChathomeListItem extends StatelessWidget {
  const ChathomeListItem({super.key, required this.name, required this.subtitle, required this.date, this.unread});
  final String name;
  final String subtitle;
  final String date;
  final String? unread;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => const ChatView()));
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal:16),
      
      leading: const CircleAvatar(
       radius: 22,
      ),
      title:Text(name) ,
      subtitle:Text(subtitle) ,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date),
          const SizedBox(height: 9,),
          Badge(
            backgroundColor: ColorApp.primaryColor,
            largeSize: 23,
            padding: const EdgeInsets.all(1),
            label:unread!=null? Text(unread!):null,
          )
        ],
      ),
    );
  }
}