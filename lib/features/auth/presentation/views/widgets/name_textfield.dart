import 'package:flutter/material.dart';
import 'package:new_chat/core/shared_widgets/custom_form_field.dart';

class NameTextfield extends StatelessWidget {
  const NameTextfield({super.key, required this.onChanged});
  @override
    final void Function(String) onChanged;

  Widget build(BuildContext context) {
    return  CustomFormField(
      isobscure: false,
      onChanged: onChanged,
      hintText: 'your name',
      labelText: 'enter your name',
      prefixIcon: const Icon(Icons.person),
      keyboardType: TextInputType.name,
      
      validate: (value){
        if (value!.isEmpty){
          return 'field is required';
        } 
        return null;
      },

    );
  }
}