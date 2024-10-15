import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_chat/core/shared_widgets/custom_form_field.dart';

class EmaiTextfield extends StatelessWidget {
  const EmaiTextfield({super.key});
  @override
  Widget build(BuildContext context) {
    return  CustomFormField(
      isobscure: false,
      hintText: 'your email',
      labelText: 'enter your email',
      prefixIcon: Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
      
      validate: (value){
        if (value!.isEmpty){
          return 'field is required';
        } else if (!value.contains('@')){
          Fluttertoast.showToast(msg: 'Email is not vaild');
          return 'Email is not vaild';
        }
        return null;
      },

    );
  }
}