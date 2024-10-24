import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/create_status_weiget.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/status_item.dart';

class StatusBody extends StatelessWidget {
  const StatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1,child: Divider(color: const Color.fromARGB(255, 0, 0, 0),thickness: .15,)),
        CreateStatusWeiget(),
        const SizedBox(height: 2,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text('Recent updates',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
        ),
        Expanded(
          child: ListView.builder(itemBuilder:(context, index) {
            
                 return  StatusItem(name: 'Aml', date: 'Today, 12:00 pm', seen: true,);}),
        ),
        
      ],
    );
  }
}