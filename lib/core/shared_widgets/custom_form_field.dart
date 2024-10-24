import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key,required this.isobscure, required this.hintText, required this.labelText, required this.prefixIcon,  this.suffixIcon, this.onPressed, required this.keyboardType,  this.onChanged, required this.validate, this.Controller});
  final bool isobscure;
  final TextEditingController? Controller;
  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onPressed;
  final TextInputType keyboardType;
  final void Function(String)?  onChanged;
  final String? Function(String?)  validate;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: isobscure,
      controller:Controller ,
      decoration: InputDecoration(
        
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon, 
        suffixIcon: suffixIcon !=null? IconButton(onPressed: onPressed, icon: Icon(suffixIcon)): null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
        ),        
      ),
      style: const TextStyle(fontSize: 14),
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validate,
    );
  }
}