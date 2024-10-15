import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/auth/presentation/views/signup_view.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/custom_botton.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/emai_textfield.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/password_textfield.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/register_row.dart';
import 'package:new_chat/features/chat_home/presentation/views/chathome_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
    
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
    GlobalKey<FormState> globalKey=GlobalKey();
    bool isvisible= false;
  @override
  
  Widget build(BuildContext context) {
    return   Center(
      child: Form(
        key: globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 30,),
                Text('Log in to your account',style: Styles.textStyle25,),
                const SizedBox(height: 30,),
                const EmaiTextfield(),
                 const SizedBox(height: 30,),
                PasswordTextfield(
                  isobscure: !isvisible,
                  togglevisibility: () { 
                  setState(() {
                    isvisible =! isvisible;
                  });
                 }, isvisible: isvisible),
                 const SizedBox(height: 50,),
                 CustomBotton(title: 'Log In', onPressed: () { 
                   if (globalKey.currentState!.validate()){
                    Fluttertoast.showToast(msg: 'success');
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const ChathomeView() ));
                   }
                  },
                 ) ,
                  const SizedBox(height: 30,),
                 RegisterRow(text1: 'Don’t have an account?',text2: ' Register here',onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const SignupView()));
                 }, ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}