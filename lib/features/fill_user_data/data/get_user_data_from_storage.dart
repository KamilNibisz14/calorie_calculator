import 'package:calorie_calculator/core/entities/goal_enum.dart';
import 'package:calorie_calculator/core/entities/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/gender_enum.dart';

class GetUserDataFromStorage{
  UserData _userData = UserData();
  Future<UserData> getUserData(String email)async{
    await _getDataFromStorage(email);
    return _userData;
  }

  Future<bool> checkIfUserDataExist(String email)async{
    var document = FirebaseFirestore.instance.collection('UserData').doc(email);
    var value = await document.get();
    if(value.exists){
      return true;
    }
    else{
      return false;
    }
  }

  Future<void> _getDataFromStorage(String email)async{
    var document = FirebaseFirestore.instance.collection('UserData').doc(email);
    var value = await document.get();
    _userData = UserData(
      goal: _getGoal(value['goal']),
      gender: _getGender(value['gender']),
      age: value['age'],
      daysOfExercise:  value['daysOfEcercise'],
      weight: value['weight'],
      height:  value['height']
    );
  }
  Goal _getGoal(String goal){
    if(goal == "Maintain"){
      return Goal.Maintain;
    }
    else if(goal == "Loss"){
      return Goal.Loss;
    }
    else{
      return Goal.Gain;
    }
  }
  Gender _getGender(String gender){
    if(gender == "male"){
      return Gender.male;
    }else{
      return Gender.female;
    }
  }

}