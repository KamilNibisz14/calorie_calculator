import 'package:firebase_auth/firebase_auth.dart';

import '../domain/entities/user_data.dart';

class CheckLogin{
  final _auth = FirebaseAuth.instance;

  Future<bool> ckeckIfLoginIsValid(GetAccessUserData loginData) async{
    try{
      final user = await _auth.signInWithEmailAndPassword(
          email: loginData.email!, password: loginData.password!
      );
      if(user != null){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }
}