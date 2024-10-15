import 'package:flutter/material.dart';
import 'package:new_chat/core/constants/asset_images.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/auth/presentation/views/signup_view.dart';
import 'package:new_chat/features/chat_home/presentation/views/chat_home_view.dart';

class SplashViewmodel extends StatefulWidget {
  const SplashViewmodel({super.key});

  @override
  State<SplashViewmodel> createState() => _SplashViewmodelState();
}

class _SplashViewmodelState extends State<SplashViewmodel> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder:(context) => const SignupView() ));
    });
  }
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4,),
            Image.asset(AssetImages.logo,width: MediaQuery.of(context).size.width*.545,
            height: MediaQuery.of(context).size.height*.23,fit: BoxFit.fill,),
                      
             Text('WhatsUp',style: Styles.textStyle24,),
           
            const Spacer(),
            Center(child: Text('The best chat app of this century',style: Styles.textStyle18,)),
           
            const Spacer(flex: 4,),
        
          ],
        ),
      ),
    );
  }
}