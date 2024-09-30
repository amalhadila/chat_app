import 'package:flutter/material.dart';
import 'package:new_chat/core/constants/asset_images.dart';
import 'package:new_chat/core/theme/color_app.dart';
import 'package:new_chat/core/theme/styles.dart';
import 'package:new_chat/features/chat_home/presentation/views/chathome_view.dart';

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
    Future.delayed(const Duration(seconds: 112),(){
      Navigator.push(context, MaterialPageRoute(builder:(context) => const ChathomeView() ));
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
            Spacer(flex: 2,),
            Image.asset(AssetImages.splashImage,width: MediaQuery.of(context).size.width*.28,
            height: MediaQuery.of(context).size.height*.125,fit: BoxFit.fill,),
             Text('WhatsUp',style: Styles.textStyle24,),
            SizedBox(height: 50,),
            Text('The best chat app of this century',style: Styles.textStyle18,),
            SizedBox(height: 50,),
            Center(
              child: ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder:(context) => const ChathomeView() ));
              }, child: Text('continue',style: Styles.textStyle16,),style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width*.9, 55),
                backgroundColor: ColorApp.primaryColor
              ),),
            ),
            Spacer(flex: 2,),
        
          ],
        ),
      ),
    );
  }
}