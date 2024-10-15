import 'package:flutter/material.dart';
import 'package:new_chat/core/constants/asset_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
     alignment: Alignment.bottomCenter,
      child: Image.asset(AssetImages.logo,fit: BoxFit.fill,width: MediaQuery.of(context).size.width*.42,
            height: MediaQuery.of(context).size.height*.188),
    );
  }
}