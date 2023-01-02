import 'package:calorie_calculator/features/get_access/domain/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUser{
  final _auth = FirebaseAuth.instance;
  Future<bool> registerUser(UserData userData)async {
    try{
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: userData.email, password: userData.password
      );
      if(newUser != null){
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