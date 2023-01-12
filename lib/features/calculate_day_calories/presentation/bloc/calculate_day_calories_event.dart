part of 'calculate_day_calories_bloc.dart';

abstract class CalculateDayCaloriesEvent extends Equatable {
  const CalculateDayCaloriesEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetCalorieDataFromStorage extends CalculateDayCaloriesEvent{
  String email;
  GetCalorieDataFromStorage({
    required this.email
  });

  @override
  List<Object> get props => [email];
}

// ignore: must_be_immutable
class SetCalorieData extends CalculateDayCaloriesEvent{
  CalorieData calorieData;
  SetCalorieData({
    required this.calorieData
  });

  @override
  List<Object> get props => [calorieData];
}

class CancelAddMealEvent extends CalculateDayCaloriesEvent{}
class AddMealEvent extends CalculateDayCaloriesEvent{}

// ignore: must_be_immutable
class AddProteinInMeal extends CalculateDayCaloriesEvent{
  double protein;
  AddProteinInMeal({
    required this.protein
  });

  @override
  List<Object> get props => [protein];
}
// ignore: must_be_immutable
class AddFatsInMeal extends CalculateDayCaloriesEvent{
  double fats;
  AddFatsInMeal({
    required this.fats
  });

  @override
  List<Object> get props => [fats];
}
// ignore: must_be_immutable
class AddCarbohydretsInMeal extends CalculateDayCaloriesEvent{
  double carbohydrates;
  AddCarbohydretsInMeal({
    required this.carbohydrates
  });

  @override
  List<Object> get props => [carbohydrates];
}

// ignore: must_be_immutable
class RemoveMealEvent extends CalculateDayCaloriesEvent{
  int index;
  RemoveMealEvent({
    required this.index
  });
  @override
  List<Object> get props => [index];
}
