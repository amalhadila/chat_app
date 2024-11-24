import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/auth/presentation/manager/cubit/register_cubit.dart';
import 'package:new_chat/features/auth/presentation/views/login_view.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/custom_botton.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/emai_textfield.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/name_textfield.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/password_textfield.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/phone_textfield.dart';
import 'package:new_chat/features/auth/presentation/views/widgets/register_row.dart';
import 'package:new_chat/features/chat_home/presentation/views/widgets/bottom_bar.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isvisible=false; 
  String? email, password,name,phone;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
         if(state is Registersuccess){
          Fluttertoast.showToast(msg: 'success');
           isloading= false;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomBar()));
        }else if(state is Registerfailure){
          Fluttertoast.showToast(msg: state.errmessage);
           isloading= false;
                         
        }else if(state is Registerloading){
          isloading= true;
                         
        }
      },
      builder: (context, state) {
        
        return ModalProgressHUD(
          inAsyncCall:isloading ,
          child: Center(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Register To New Account',
                        style: Styles.textStyle25,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                       NameTextfield(
                         onChanged: (value) {
                          name=value;
                          
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                       EmaiTextfield(
                        onChanged: (value) {
                          email=value;
                          
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                       PhoneTextfield(
                         onChanged: (value) {
                          phone=value;
                          
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PasswordTextfield(
                         onChanged: (value) {
                          password=value;
                          
                        },
                          isobscure: !isvisible,
                          togglevisibility: () {
                           setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          isvisible: isvisible),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomBotton(
                        title: 'Sign Up',
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).register(email: email!, password: password!, name: name!, phone: phone!);

                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RegisterRow(
                        text1: 'Already have an account?',
                        text2: ' Login here',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );}
     
    );
  }
}
