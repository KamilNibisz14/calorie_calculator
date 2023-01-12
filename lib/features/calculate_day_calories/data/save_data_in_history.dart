
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/calorie_data.dart';

class SaveDataInHistory{
  Future<void> saveDataInHistory(String date, List<CalorieData> calorieData, String email) async {
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection('history').doc(email).get();
    if(!ds.exists){
      final document = FirebaseFirestore.instance.collection('history').doc(email);
      List<String> list = [];
      list.add('$date;${_caluculateDayMacroelements(calorieData)}');
      Map<String, dynamic> jsonData = {
        'day': list,
      };
      await document.set(jsonData); 
    }else{
      _updateHistory(date, calorieData, email);
    }
  }
  String _caluculateDayMacroelements(List<CalorieData> calorieData){
    CalorieData dayCalorieData = CalorieData();
    for(int i = 0; i < calorieData.length; ++i){
      dayCalorieData.addValue(calorieData[i]);
    }
    return '${dayCalorieData.totalKcal};${dayCalorieData.carbohydrates};${dayCalorieData.fats};${dayCalorieData.protein};';
  }
  void _updateHistory(String date, List<CalorieData> calorieData, String email)async{
    List<String> listOfDays;
    var document = FirebaseFirestore.instance.collection('history').doc(email);
    var value = await document.get();
    listOfDays = List<String>.from(value['day'] as List);
    listOfDays.add('$date;${_caluculateDayMacroelements(calorieData)}');
    Map<String, dynamic> jsonData = {
        'day': listOfDays,
      };
    await document.set(jsonData); 
  }
}