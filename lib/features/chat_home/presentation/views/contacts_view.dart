import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/contacts_body.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key,required this.contacts});
 final List<Contact?> contacts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Contacts on WhatsApp',style: Styles.textStyle18.copyWith(color: Colors.black),),
         backgroundColor: Colors.white,
      ),
      body:   ContactsBody(contacts: contacts,));
  }
}