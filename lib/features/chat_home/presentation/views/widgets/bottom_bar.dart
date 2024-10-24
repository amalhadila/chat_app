import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/chat_home/presentation/views/calls_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/chathome_view.dart';
import 'package:new_chat/features/profile/presentation/views/profile_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/status_view.dart';
import 'package:new_chat/features/splash/presentation/views/splash_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int currentindex =0;
   static const List<Widget> _pages =[
    ChathomeView(),
    StatusView(),
    CallsView(),
   ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
         title: Text('WhatsUp',style: Styles.textStyle18.copyWith(color: Colors.black),),
        actions: [  
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              const SizedBox(width: 10,),
                        
            PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert), 
          color:Colors.white ,
           onSelected: (String value) {
    if (value == 'profile') {
      Navigator.push(context, MaterialPageRoute(builder:(context) => const ProfileView()));
    } else if (value == 'log out') {
       Navigator.push(context, MaterialPageRoute(builder:(context) => const SplashView()));
    }
  },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profile',
                child:  Text('profile'),
              ),
              const PopupMenuItem<String>(
                value: 'log out',
                child:  Text('log out'),
              ),

            ];
          },
        ),
         
        ],
      ),
      body: _pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(  
        backgroundColor: Colors.white,    
        elevation: 0,
      onTap: (value){        
        setState(() {
          currentindex=value;
        });
      },
      currentIndex: currentindex,
      fixedColor:  ColorApp.primaryColor,
     // unselectedItemColor:ColorApp.primaryColor,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chats'),
      BottomNavigationBarItem(icon: Icon(Icons.lightbulb),label: 'Status'),
      BottomNavigationBarItem(icon: Icon(Icons.phone),label: 'Calls'),
    ],
     
    ),
    ) ;
  }
}