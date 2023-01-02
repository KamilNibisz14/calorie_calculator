import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/core/entities/calorie_data.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/gender_enum.dart';
import '../../../../core/entities/goal_enum.dart';
import '../../../../core/entities/user_data.dart';

part 'user_information_event.dart';
part 'user_information_state.dart';

class UserInformationBloc extends Bloc<UserInformationEvent, UserInformationState> {
  UserData _userData = UserData();
  CalorieData _calorieData = CalorieData();
  UserInformationBloc() : super(UserInformationState(userData: UserData())) {
    on<UserInformationEvent>((event, emit) {
    });

    on<GenderChoiceEvent>(_onChoiceGender);
    on<HeightChoiceEvent>(_onHeightChoiceEvent);
    on<WeightChoiceEvent>(_onWeightChoiceEvent);
    on<AddAgeEvent>(_onAddAgeEvent);
    on<RemoveAgeEvent>(_onRemoveAgeEvent);
    on<AddDaysEvent>(_onAddDaysEvent);
    on<RemoveDaysEvent>(_onRemoveDaysEvent);
    on<GoalChoiceEvent>(_onGoalChoiceEvent);
    on<CalculatCalorie>(_onCalculateCalorie);
  }
  _onChoiceGender(GenderChoiceEvent event, Emitter<UserInformationState> emit){
    _userData.gender = event.gender;
    emit(UserInformationState(
      userData: _userData
    ));
  }
  _onHeightChoiceEvent(HeightChoiceEvent event, Emitter<UserInformationState> emit){
    _userData.height = event.height.ceil();
    emit(UserInformationState(
      userData: _userData,
    ));
  }
    _onWeightChoiceEvent(WeightChoiceEvent event, Emitter<UserInformationState> emit){
    _userData.weight = event.weight;
    emit(UserInformationState(
      userData: _userData
    ));
  }

    _onGoalChoiceEvent(GoalChoiceEvent event, Emitter<UserInformationState> emit){
      if(event.goal == 0){
        _userData.goal = Goal.Loss;
      }else if(event.goal == 1){
        _userData.goal = Goal.Maintain;
      }else{
        _userData.goal = Goal.Gain;
      }
    emit(UserInformationState(
      userData: _userData
    ));
  }

  _onAddAgeEvent(AddAgeEvent event, Emitter<UserInformationState> emit){
    if(_userData.age < 110){
      _userData.age++;
    }
    emit(UserInformationState(
      userData: _userData
    ));
  }
  _onRemoveAgeEvent(RemoveAgeEvent event, Emitter<UserInformationState> emit){
    if(_userData.age > 0){
      _userData.age--;
    }
    emit(UserInformationState(
      userData: _userData
    ));
  }
  _onAddDaysEvent(AddDaysEvent event, Emitter<UserInformationState> emit){
    if(_userData.daysOfExercise < 7){
      _userData.daysOfExercise++;
    }
    emit(UserInformationState(
      userData: _userData
    ));
  }
  _onRemoveDaysEvent(RemoveDaysEvent event, Emitter<UserInformationState> emit){
    if(_userData.daysOfExercise > 0){
      _userData.daysOfExercise--;
    }
    emit(UserInformationState(
      userData: _userData
    ));
  }
  _onCalculateCalorie(CalculatCalorie event, Emitter<UserInformationState> emit){
    if(_userData.gender == Gender.male){
      _calorieData.totalKcal = (66 + (13.7 * _userData.weight) + (5*_userData.height) - (6.67 * _userData.age)).ceil();
      if(_userData.goal == Goal.Gain){
        _calorieData.totalKcal += 300;
      }else if(_userData.goal == Goal.Loss){
        _calorieData.totalKcal -= 250;
      }
      _calorieData.totalKcal += 150 * _userData.daysOfExercise;

    }else{
      _calorieData.totalKcal = (655 + (9.6 * _userData.weight) + (1.8*_userData.height) - (4.7 * _userData.age)).ceil();
      if(_userData.goal == Goal.Gain){
        _calorieData.totalKcal += 250;
      }else if(_userData.goal == Goal.Loss){
        _calorieData.totalKcal -= 200;
      }
      _calorieData.totalKcal += 125 * _userData.daysOfExercise;
    }
    _calorieData.carbohydrates = (_calorieData.totalKcal * 0.54);
    _calorieData.protein = (_calorieData.totalKcal * 0.24);
    _calorieData.fats = (_calorieData.totalKcal * 0.22);
    print(_calorieData.carbohydrates);
    print(_calorieData.protein);
    print(_calorieData.fats);
  }
}
