import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/create_group_body.dart';

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  CreateGroupBody());
  }
}