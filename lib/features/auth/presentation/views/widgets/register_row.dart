import 'package:flutter/material.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key,this.onPressed, required this.text1, required this.text2});
  final String text1;
  final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,style:const TextStyle(fontWeight: FontWeight.w500) ,),
        TextButton(onPressed: onPressed, child: Text(text2,style:const TextStyle(fontWeight: FontWeight.w500) ,))
      ],
    );
  }
}