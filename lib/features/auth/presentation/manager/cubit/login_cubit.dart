import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
    
  Future<void> login({required String email,required String password}) async{
    emit(Loginloading());
    try {
  UserCredential User =await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  emit(Loginsuccess());
}on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    emit(Loginfailure(errmessage: 'No user found for that email.'));
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    emit(Loginfailure(errmessage: 'Wrong password provided for that user.'));
  }
  else {
    emit(Loginfailure(errmessage: e.code));
    print(e.code);
} 
  }catch (e) {
 emit(Loginfailure(errmessage: e.toString()));
}
  }
}


