
import 'package:calorie_calculator/core/entities/calorie_data.dart';
import 'package:calorie_calculator/features/summary/domain/entities/summary_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetHistoryData{
  List<SummaryData> _summaryData = [];
  Future<bool> checkIfUserDataExist(String email)async{
    var document = FirebaseFirestore.instance.collection('history').doc(email);
    var value = await document.get();
    if(value.exists){
      return true;
    }
    else{
      return false;
    }
  }

  Future<List<SummaryData>> getSummaryData(String email)async{
    await _getSummaryDataFromStorage(email);
    return _summaryData;
  }
  Future<void> _getSummaryDataFromStorage(String email)async{
    var document = FirebaseFirestore.instance.collection('history').doc(email);
    var value = await document.get();
    _summaryData = _convertData(List<String>.from(value['day'] as List));
  }
  List<SummaryData> _convertData(List<String> data){
    List<SummaryData> listOfSummary = [];
    for(int i = 0; i < data.length; ++i){
      SummaryData summary = SummaryData();
      String rawData = data[i];
      summary.data = rawData.substring(0,rawData.indexOf(';'));
      rawData = rawData.replaceRange(0, rawData.indexOf(';') + 1, '');
      CalorieData calorieData = CalorieData();
      calorieData.totalKcal = double.parse(rawData.substring(0,rawData.indexOf(';')));
      rawData = rawData.replaceRange(0, rawData.indexOf(';') + 1, '');
      calorieData.carbohydrates = double.parse(rawData.substring(0,rawData.indexOf(';')));
      rawData = rawData.replaceRange(0, rawData.indexOf(';') + 1, '');
      calorieData.fats = double.parse(rawData.substring(0,rawData.indexOf(';')));
      rawData = rawData.replaceRange(0, rawData.indexOf(';') + 1, '');
      calorieData.protein = double.parse(rawData.substring(0,rawData.indexOf(';')));
      summary.calorieData = calorieData;
      listOfSummary.add(summary);
    }
    return listOfSummary;
  }

}