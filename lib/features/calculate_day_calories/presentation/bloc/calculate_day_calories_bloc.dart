import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/core/entities/calorie_data.dart';
import 'package:equatable/equatable.dart';

import '../../../../locator.dart';
import '../../data/get_calorie_data_from_storage.dart';
import '../../data/get_meals_from_storage.dart';
import '../../data/save_meals_in_storage.dart';

part 'calculate_day_calories_event.dart';
part 'calculate_day_calories_state.dart';

class CalculateDayCaloriesBloc extends Bloc<CalculateDayCaloriesEvent, CalculateDayCaloriesState> {
  CalorieData _calorieData = CalorieData();
  CalorieData _caloriesThroughoutTheDay = CalorieData();
  List<CalorieData> _meals = [];
  late String email;

  CalorieData _fillCalorieData = CalorieData();
  

  CalculateDayCaloriesBloc() : super(CalculateDayCaloriesInitial(calorieData: CalorieData(), meals: [], caloriesThroughoutTheDay: CalorieData())) {
    on<CalculateDayCaloriesEvent>((event, emit) {
    });
    on<GetCalorieDataFromStorage>(_onGetCalorieDataFromStorage);
    on<SetCalorieData>(_onSetCalorieData);
    on<CancelAddMealEvent>(_onCancelAddMealEvent);
    on<AddMealEvent>(_onAddMealEvent);
    on<AddCarbohydretsInMeal>(_onAddCarbohydretsInMeal);
    on<AddFatsInMeal>(_onAddFatsInMeal);
    on<AddProteinInMeal>(_onAddProteinInMeal);
    on<RemoveMealEvent>(_onRemoveMealEvent);
  }

  _onGetCalorieDataFromStorage(GetCalorieDataFromStorage event, Emitter<CalculateDayCaloriesState> emit)async{
    email = event.email;
    if(await  locator.get<GetCalorieData>().checkIfUserCalorieDataExist(event.email)){
      _calorieData = await locator.get<GetCalorieData>().getCalorieData(event.email);

      if(await locator.get<GetMelasFromStorage>().checkIfUserDataExist(email)){
        _meals = await locator.get<GetMelasFromStorage>().getMealsFromStorage(email);
        caloculateMacroelements();
      }
      emit(FillCalculateDayCaloriesState(calorieData: _calorieData, meals: _meals, caloriesThroughoutTheDay: _caloriesThroughoutTheDay));
    }else{
      emit(FailToGetDataFromStorage(calorieData: _calorieData, meals: _meals, caloriesThroughoutTheDay: _caloriesThroughoutTheDay));
    }
  }

  _onSetCalorieData(SetCalorieData event, Emitter<CalculateDayCaloriesState> emit){
    email = event.email;
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
      _fillCalorieData = CalorieData();

      locator.get<SetMealsInStorage>().setMealsInStorage(_meals, email);

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
  _onRemoveMealEvent(RemoveMealEvent event, Emitter<CalculateDayCaloriesState> emit){
    _caloriesThroughoutTheDay.subtractionValue(_meals[event.index]);
    _meals.removeAt(event.index);
    locator.get<SetMealsInStorage>().setMealsInStorage(_meals, email);
    emit(FillCalculateDayCaloriesState(calorieData: _calorieData, meals: _meals, caloriesThroughoutTheDay: _caloriesThroughoutTheDay));
  }

  void caloculateMacroelements(){
    for(int i = 0; i < _meals.length; ++i){
      _caloriesThroughoutTheDay.addValue(_meals[i]);
    }
  }

}
