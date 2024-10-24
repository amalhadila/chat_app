import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/calls_item.dart';

class CallsBody extends StatelessWidget {
  const CallsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[         
         const SizedBox(height: 1,child: Divider(color: Color.fromARGB(255, 0, 0, 0),thickness: .15,)),
         const SizedBox(height: 15,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text('Recent',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
        ),
        Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const CallsItem(name: 'Aml', date: 'Today 12:00 pm',icon:Icons.phone,);
            
          },
        
        ),
      ),]
    );
  }
}