import 'package:flutter/material.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/core/theme/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.title, required this.onPressed});
  final String title;
  final  void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return  Center(
              child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width*.9, 55),
                backgroundColor: ColorApp.primaryColor,
              ),
            
               child: Text(title,style: Styles.textStyle25.copyWith(color: Colors.white),),),
            );
  }
}