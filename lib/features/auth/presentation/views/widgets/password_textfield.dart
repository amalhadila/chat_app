import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_chat/core/shared_widgets/custom_form_field.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key,required this.onChanged ,required this.togglevisibility, required this.isvisible, required this.isobscure});
  final VoidCallback togglevisibility;
  final bool isvisible;
  final bool isobscure;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return  CustomFormField(
      onChanged: onChanged,
      isobscure: isobscure,
      keyboardType: TextInputType.visiblePassword,
      validate: (value ) { 
        if (value!.isEmpty){
          return 'field is requird';
        }else if (value.length<8){
          Fluttertoast.showToast(msg: 'The password is too short');
          return   'The password is too short';
        }
        return null;
       },
      hintText: 'your password', 
     labelText: 'enter your password', 
     prefixIcon: const Icon(Icons.lock),
     suffixIcon: isvisible? Icons.visibility: Icons.visibility_off,
     onPressed: togglevisibility,
     );
  }
}