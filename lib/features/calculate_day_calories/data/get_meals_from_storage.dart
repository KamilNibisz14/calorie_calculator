
import 'package:calorie_calculator/features/calculate_day_calories/data/save_data_in_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/calorie_data.dart';
import '../../../locator.dart';

class GetMelasFromStorage{
  late String _date;
  List<CalorieData> _convertedMeals = [];
  Future<List<CalorieData>> getMealsFromStorage(String email)async{
    await _getMealsFromStorage(email);
    return _convertedMeals;
  }
  Future<bool> checkIfUserDataExist(String email)async{
    var document = FirebaseFirestore.instance.collection('meals').doc(email);
    var value = await document.get();
    if(value.exists){
      return true;
    }
    else{
      return false;
    }
  }

  Future<void> _getMealsFromStorage(String email)async{
    var document = FirebaseFirestore.instance.collection('meals').doc(email);
    var value = await document.get();
    _date = value['date'];
    _convertedMeals = _convertData(List<String>.from(value['meals'] as List));
    _checkIfDayIsPresent(email);

  }

  void _checkIfDayIsPresent(String email){
    if(_date != DateTime.now().toString().substring(0,10)){
      if(_convertedMeals.isNotEmpty){
        locator.get<SaveDataInHistory>().saveDataInHistory(_date, _convertedMeals, email);
      }
      _convertedMeals = [];
      _deleteDocument(email);
    }
  }
  void _deleteDocument(String email){
    var document = FirebaseFirestore.instance.collection('meals');
    document.doc(email).delete();
  }

  List<CalorieData> _convertData(List<String> meals){
    List<CalorieData> convertedMeals = [];
    for(int i = 0; i < meals.length; ++i){
      String meal = meals[i].toString();
      CalorieData caloriedata = CalorieData();
      caloriedata.totalKcal = double.parse(meal.substring(0,meal.indexOf(';')));
      meal = meal.replaceRange(0, meal.indexOf(';') + 1, '');
      caloriedata.carbohydrates = double.parse(meal.substring(0,meal.indexOf(';')));
      meal = meal.replaceRange(0, meal.indexOf(';') + 1, '');
      caloriedata.fats = double.parse(meal.substring(0,meal.indexOf(';')));
      meal = meal.replaceRange(0, meal.indexOf(';') + 1, '');
      caloriedata.protein = double.parse(meal.substring(0,meal.indexOf(';')));
      convertedMeals.add(caloriedata);
    }
    return convertedMeals;
  }
}