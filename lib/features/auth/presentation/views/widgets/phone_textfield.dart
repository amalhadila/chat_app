import 'package:flutter/material.dart';
import 'package:new_chat/core/shared_widgets/custom_form_field.dart';

class PhoneTextfield extends StatelessWidget {
  const PhoneTextfield({super.key});
  @override
  Widget build(BuildContext context) {
    return  CustomFormField(
      isobscure: false,
      hintText: 'your phone',
      labelText: 'enter your phone',
      prefixIcon: const Icon(Icons.phone_android),
      keyboardType: TextInputType.phone,
      
      validate: (value){
        if (value!.isEmpty){
          return 'field is required';
        } 
        return null;
      },

    );
  }
}