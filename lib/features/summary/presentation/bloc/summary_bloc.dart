import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/features/summary/domain/entities/summary_data.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/calorie_data.dart';
import '../../../../locator.dart';
import '../../data/get_history_data.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  List<SummaryData> _summaryData = [];
  late CalorieData _mainCalorieData = CalorieData();
  SummaryBloc() : super(SummaryInitial()) {
    on<SummaryEvent>((event, emit) {});
    on<GetDataFromStorage>(_onGetDataFromStorage);
  }
  _onGetDataFromStorage(GetDataFromStorage event, Emitter<SummaryState> emit)async{
    if(await locator.get<GetHistoryData>().checkIfUserDataExist(event.email)){
      _summaryData = await locator.get<GetHistoryData>().getSummaryData(event.email);
      calculateMainCalorieData();
      emit(SummaryShowState(summaryData: _summaryData, mainCalorieData: _mainCalorieData));
    }
    else{
      emit(SummaryIsEmptyState());
    }
  }
  int counterDays(){
    return _summaryData.length;
  }
  void calculateMainCalorieData(){
    for(int i = 0; i < _summaryData.length; ++i){
      _mainCalorieData.addValue(_summaryData[i].calorieData);
    }
  }
}
