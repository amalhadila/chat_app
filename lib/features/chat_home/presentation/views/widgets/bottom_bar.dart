import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/auth/presentation/views/login_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/calls_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/chathome_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/create_group_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/groups_view.dart';
import 'package:new_chat/features/profile/presentation/views/profile_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/status_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int currentindex =0;
     bool _isSearchActive = false;
       TextEditingController _searchController = TextEditingController();

      String  search_text='';
   static  List<Widget> _pages =[   
   ];
  @override
    @override
  void initState() {
    super.initState();
    _pages = [
      ChathomeView(search_text: search_text),
      GroupsView(),
      const StatusView(),
      const CallsView(),
    ];
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
         title: ( _isSearchActive && currentindex==0)
          ? TextField(
            onChanged: (value) {
              setState(() {
                search_text=value;
                _pages[0] = ChathomeView(search_text: search_text);
              });
            },
              controller: _searchController,
              style: Styles.textStyle18.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: InputBorder.none,
              ),
            ):
            Text('WhatsUp',style: Styles.textStyle18.copyWith(color: Colors.black),),
        actions: [  
              IconButton(onPressed: (){
                setState(() {
              _isSearchActive = !_isSearchActive;
              if (!_isSearchActive) {
                 search_text='';
                _pages[0] = ChathomeView(search_text: search_text);
                _searchController.clear();
              }
            });

              }, icon: Icon(( _isSearchActive && currentindex==0)
          ? Icons.close : Icons.search),),
              const SizedBox(width: 10,),
                        
            PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert), 
          color:Colors.white ,
           onSelected: (String value)async {
    if (value == 'profile') {
      Navigator.push(context, MaterialPageRoute(builder:(context) => const ProfileView()));
    } else if (value == 'log out')  {
     await FirebaseAuth.instance.signOut();
     Navigator.push(context, MaterialPageRoute(builder:(context) => const LoginView()));
    
    }else if (value == 'New group')  {
     Navigator.push(context, MaterialPageRoute(builder:(context) => const CreateGroupView())); 
    
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
              const PopupMenuItem<String>(
                value: 'New group',
                child:  Text('New group'),
              ),

            ];
          },
        ),
         
        ],
      ),
      body: _pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(  
        backgroundColor: Colors.white,    
         type: BottomNavigationBarType.fixed,
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
      BottomNavigationBarItem(icon: Icon(Icons.group),label: 'group'),
      BottomNavigationBarItem(icon: Icon(Icons.lightbulb),label: 'Status'),
      BottomNavigationBarItem(icon: Icon(Icons.phone),label: 'Calls'),
    ],
     
    ),
    ) ;
  }
}