part of 'calculate_day_calories_bloc.dart';

// ignore: must_be_immutable
abstract class CalculateDayCaloriesState {
  CalorieData calorieData;
  CalorieData caloriesThroughoutTheDay; 
  List<CalorieData> meals;
  CalculateDayCaloriesState({
    required this.calorieData,
    required this.meals,
    required this.caloriesThroughoutTheDay,
  });
  
  List<Object> get props => [calorieData, meals];
}

// ignore: must_be_immutable
class CalculateDayCaloriesInitial extends CalculateDayCaloriesState {
  CalculateDayCaloriesInitial({
    required super.calorieData, 
    required super.meals,
    required super.caloriesThroughoutTheDay
  });
  
  @override
  List<Object> get props => [calorieData, meals, caloriesThroughoutTheDay];
}

class FillCalculateDayCaloriesState extends CalculateDayCaloriesState{
  FillCalculateDayCaloriesState({
    required super.calorieData, 
    required super.meals,
    required super.caloriesThroughoutTheDay
  });

  @override
  List<Object> get props => [calorieData, meals];
}

class FailToGetDataFromStorage extends CalculateDayCaloriesState{
  FailToGetDataFromStorage({
    required super.calorieData, 
    required super.meals,
    required super.caloriesThroughoutTheDay
  });

  @override
  List<Object> get props => [calorieData, meals];
}