import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/core/entities/calorie_data.dart';
import 'package:equatable/equatable.dart';

part 'calculate_day_calories_event.dart';
part 'calculate_day_calories_state.dart';

class CalculateDayCaloriesBloc extends Bloc<CalculateDayCaloriesEvent, CalculateDayCaloriesState> {
  CalorieData _calorieData = CalorieData();
  CalorieData _caloriesThroughoutTheDay = CalorieData();
  List<CalorieData> _meals = [];

  CalorieData _fillCalorieData = CalorieData();
  

  CalculateDayCaloriesBloc() : super(CalculateDayCaloriesInitial(calorieData: CalorieData(), meals: [], caloriesThroughoutTheDay: CalorieData())) {
    on<CalculateDayCaloriesEvent>((event, emit) {
    });
    on<SetCalorieData>(_onSetCalorieData);
    on<CancelAddMealEvent>(_onCancelAddMealEvent);
    on<AddMealEvent>(_onAddMealEvent);
    on<AddCarbohydretsInMeal>(_onAddCarbohydretsInMeal);
    on<AddFatsInMeal>(_onAddFatsInMeal);
    on<AddProteinInMeal>(_onAddProteinInMeal);
  }
  _onSetCalorieData(SetCalorieData event, Emitter<CalculateDayCaloriesState> emit){
    _calorieData = event.calorieData;
    emit(FillCalculateDayCaloriesState(calorieData: _calorieData, meals: _meals, caloriesThroughoutTheDay: _caloriesThroughoutTheDay));
  }
  _onCancelAddMealEvent(CancelAddMealEvent event, Emitter<CalculateDayCaloriesState> emit){
    _fillCalorieData = CalorieData();
  }
  _onAddMealEvent(AddMealEvent event, Emitter<CalculateDayCaloriesState> emit){
    if(_fillCalorieData.protein == 0 && _fillCalorieData.fats == 0 && _fillCalorieData.carbohydrates == 0){
      _fillCalorieData = CalorieData();
    }
    else{
      _fillCalorieData.totalKcal = ((_fillCalorieData.carbohydrates * 4) + (_fillCalorieData.protein * 4) + (_fillCalorieData.fats * 9));
      _meals.add(_fillCalorieData);
      _caloriesThroughoutTheDay.addValue(_fillCalorieData);
      print(_caloriesThroughoutTheDay.carbohydrates);
      print(_caloriesThroughoutTheDay.protein);
      print(_caloriesThroughoutTheDay.fats);
      _fillCalorieData = CalorieData();
      emit(FillCalculateDayCaloriesState(calorieData: _calorieData, meals: _meals, caloriesThroughoutTheDay: _caloriesThroughoutTheDay));
    }
  }
  _onAddCarbohydretsInMeal(AddCarbohydretsInMeal event, Emitter<CalculateDayCaloriesState> emit){
    _fillCalorieData.carbohydrates = event.carbohydrates;
  }
  _onAddFatsInMeal(AddFatsInMeal event, Emitter<CalculateDayCaloriesState> emit){
    _fillCalorieData.fats = event.fats;
  }
  _onAddProteinInMeal(AddProteinInMeal event, Emitter<CalculateDayCaloriesState> emit){
    _fillCalorieData.protein = event.protein;
  }
}
