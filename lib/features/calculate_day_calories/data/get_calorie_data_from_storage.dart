import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/calorie_data.dart';

class GetCalorieData{
  CalorieData _userCalorieData = CalorieData();
  Future<CalorieData> getCalorieData(String email)async{
    await _getDataFromStorage(email);
    return _userCalorieData;
  }

  Future<bool> checkIfUserCalorieDataExist(String email)async{
    var document = FirebaseFirestore.instance.collection('UserCalorieData').doc(email);
    var value = await document.get();
    if(value.exists){
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> _getDataFromStorage(String email)async{
    var document = FirebaseFirestore.instance.collection('UserCalorieData').doc(email);
    var value = await document.get();
    _userCalorieData = CalorieData(
      carbohydrates: value['carbohydrates'],
      fats: value['fats'],
      protein: value['protein'],
      totalKcal: value['totalKcal'],
    );
  }
}