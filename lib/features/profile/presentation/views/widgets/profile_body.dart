import 'package:flutter/material.dart';
import 'package:new_chat/core/shared_widgets/custom_botton.dart';
import 'package:new_chat/core/shared_widgets/custom_form_field.dart';
import 'package:new_chat/core/theme/color_app.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  SizedBox(height: 1,child: Divider(color:  Color.fromARGB(255, 0, 0, 0),thickness: .15,)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(child: Stack(children:[ CircleAvatar(radius: 60,),
            Positioned(
               bottom: 0, 
              left: 82,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorApp.primaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.edit,size: 20,color: Colors.white,),
                ),
              ),
            )
            
            ])),
          ),
         
          SizedBox(height: 1,child: Divider(color: const Color.fromARGB(255, 0, 0, 0),thickness: .15,)),
           SizedBox(height:35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
            SizedBox(height:10,),
            CustomFormField(
               isobscure: false,
                    hintText: 'your name',
                    labelText: 'enter your name',
                    prefixIcon: const Icon(Icons.person),
                    keyboardType: TextInputType.name,
                    
                    validate: (value){
            if (value!.isEmpty){
              return 'field is required';
            } 
            return null;
                    },
            ),
                     SizedBox(height: 40,),
                     Text('Phone'),
                     SizedBox(height: 10,),
            CustomFormField(
                    isobscure: false,
                    hintText: 'your phone',
                    labelText: 'enter your phone',
                    prefixIcon: const Icon(Icons.phone_android),
                    keyboardType: TextInputType.phone,
                    
                    validate: (value){
            if (value!.isEmpty){
              return 'field is required';
            } 
            return null;
                    },
                  
                  ),
                  SizedBox(height: 40,),
                  CustomBotton(
                    title:
              
              '  Save Profile',
                    icon:Icons.save,    
            
                     
                    onPressed: (){},
                  )
                  
              ],
            ),
          )
          
        ],
      
      ),
    );
  }
}