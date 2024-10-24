import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chathome_list_item.dart';

class ChathomeBody extends StatelessWidget {
  const ChathomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[         
         SizedBox(height: 1,child: Divider(color: const Color.fromARGB(255, 0, 0, 0),thickness: .15,)),
         
        Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const ChathomeListItem(name: 'Aml', subtitle: 'first message', date: '12:00 pm',unread: '2',);
            
          },
        
        ),
      ),]
    );
  }
}