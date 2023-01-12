
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/calorie_data.dart';

class SetMealsInStorage{
  void setMealsInStorage(List<CalorieData> meals, String email)async{
    List<String> convertedMeals = _convertMeals(meals);
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection('meals').doc(email).get();
    if(!ds.exists){
      final userCalorieData = FirebaseFirestore.instance.collection('meals').doc(email);
      Map<String, dynamic> jsonData = {
        'date': DateTime.now().toString().substring(0,10),
        'meals': convertedMeals
      };
      await userCalorieData.set(jsonData); 
    }else{
      var collection = FirebaseFirestore.instance.collection('meals');
      collection.doc(email).update({
        'meals': convertedMeals
      });
    }
  }
  List<String> _convertMeals(List<CalorieData> meals){
    List<String> convertedMeals = [];
    for(int i = 0; i < meals.length; ++i){
      convertedMeals.add('${meals[i].totalKcal};${meals[i].carbohydrates};${meals[i].fats};${meals[i].protein};');
    }
    return convertedMeals;
  }
}