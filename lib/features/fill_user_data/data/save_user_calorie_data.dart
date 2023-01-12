import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/calorie_data.dart';

class SaveUserCalorieData{
  void saveUserCalorieData(CalorieData calorieData, String email)async{
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection('UserCalorieData').doc(email).get();
    if(!ds.exists){
      final userCalorieData = FirebaseFirestore.instance.collection('UserCalorieData').doc(email);
      Map<String, dynamic> jsonData = {
        'totalKcal': calorieData.totalKcal,
        'carbohydrates': calorieData.carbohydrates,
        'fats': calorieData.fats,
        'protein': calorieData.protein,
      };
      await userCalorieData.set(jsonData); 
    }else{
      var collection = FirebaseFirestore.instance.collection('UserCalorieData');
      collection.doc(email).update({
        'totalKcal': calorieData.totalKcal,
        'carbohydrates': calorieData.carbohydrates,
        'fats': calorieData.fats,
        'protein': calorieData.protein,
      });
    }

  }
}