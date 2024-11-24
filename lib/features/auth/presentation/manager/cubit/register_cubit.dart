import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:new_chat/core/firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());  
  
  Future<void> register({required String email,required String password,required String name,required String phone}) async{
    emit(Registerloading());
    try {
  UserCredential User =
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  Firebaseauth.createuser(name: name, phone: phone);

  emit(Registersuccess());
}on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    emit(Registerfailure(errmessage: 'The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
    emit(Registerfailure(errmessage: 'The account already exists for that email.'));
    print('The account already exists for that email.');
  } else {
    emit(Registerfailure(errmessage: e.code));
    print(e.code);
} 
  }catch (e) {
 emit(Registerfailure(errmessage: e.toString()));
}
  }
}
