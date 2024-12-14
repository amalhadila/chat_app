import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/features/chat_home/presentation/manager/chat_firebase/firebase_chat.dart';
import 'package:new_chat/features/chat_home/presentation/views/contacts_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/chathome_body.dart';

class ChathomeView extends StatefulWidget {
   ChathomeView({super.key, required this.search_text});

  @override
  final String search_text;
  State<ChathomeView> createState() => _ChathomeViewState();
}

class _ChathomeViewState extends State<ChathomeView> {

  bool _permissionDenied = false;

    void initState() {
    super.initState();
  
  }
       List<Contact?> fullContact_list=[];

  Future<void> _fetchContacts() async {
  if (!await FlutterContacts.requestPermission(readonly: true)) {
    setState(() => _permissionDenied = true);
    return;
  }

  final contacts = await FlutterContacts.getContacts();
  List<String> phoneNumbers = [];

  for (Contact contact in contacts) {
    Contact? fullContact = await FlutterContacts.getContact(contact.id);
    if (fullContact != null && fullContact.phones.isNotEmpty) {
      String phone = fullContact.phones.first.number.trim(); 
      if (!phoneNumbers.contains(phone)) {
        phoneNumbers.add(phone);  }
    }
  }

  await FirebaseChat().addContacts(phoneNumbers);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        bool permissionGranted = await FlutterContacts.requestPermission();
    await _fetchContacts();
    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactsView(contacts: fullContact_list),
          ),
        );
       

      

        FirebaseChat().createroom('q@gmail.com');
      },
      backgroundColor: ColorApp.primaryColor,
      child:const Icon(Icons.message, color: Colors.white,)),
      body: ChathomeBody(search_text:widget.search_text),
    );
  }
}