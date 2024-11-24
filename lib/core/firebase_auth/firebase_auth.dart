import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_chat/features/auth/data/models/user_model.dart';

class Firebaseauth {
  static FirebaseAuth auth=FirebaseAuth.instance;
  static FirebaseFirestore firebasestorage = FirebaseFirestore.instance;
  static User? user=auth.currentUser;
  static  Future createuser({required String name,required String phone}) async{
    UserModel chatuser =UserModel(
      id: user!.uid,
      name: user!.displayName??name,
      email: user!.email??'',
      image: '',
      createdAt: DateTime.now().toString(),
      lastActivate: DateTime.now().toString(),
      token: '',
      active: true,
      about: 'Hello I am using whataApp',
      phone:phone,


    );
    await firebasestorage.collection('users').doc(user!.uid).set(chatuser.toMap());
  }
}