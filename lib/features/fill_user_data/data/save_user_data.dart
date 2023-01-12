
import 'package:calorie_calculator/core/entities/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveUserData{
  void saveUserData(UserData userData, String email)async{
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection('UsereData').doc(email).get();
    if(!ds.exists){
      final userCalorieData = FirebaseFirestore.instance.collection('UserData').doc(email);
      Map<String, dynamic> jsonData = {
        'age': userData.age,
        'daysOfEcercise': userData.daysOfExercise,
        'gender': userData.gender.name,
        'goal': userData.goal.name,
        'height': userData.height,
        'weight': userData.weight,
      };
      await userCalorieData.set(jsonData); 
    }else{
      var collection = FirebaseFirestore.instance.collection('UserData');
      collection.doc(email).update({
        'age': userData.age,
        'daysOfEcercise': userData.daysOfExercise,
        'gender': userData.gender.name,
        'goal': userData.goal.name,
        'height': userData.height,
        'weight': userData.weight,
      });
    }

  }
}