import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/core/entities/calorie_data.dart';
import 'package:calorie_calculator/features/fill_user_data/data/save_user_data.dart';
import 'package:calorie_calculator/locator.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/gender_enum.dart';
import '../../../../core/entities/goal_enum.dart';
import '../../../../core/entities/user_data.dart';
import '../../data/get_user_data_from_storage.dart';
import '../../data/save_user_calorie_data.dart';

part 'user_information_event.dart';
part 'user_information_state.dart';

class UserInformationBloc extends Bloc<UserInformationEvent, UserInformationState> {
  UserData _userData = UserData();
  CalorieData _calorieData = CalorieData();
  UserInformationBloc() : super(UserInformationInitialState(userData: UserData())) {
    on<UserInformationEvent>((event, emit) {
    });

    on<GetDataFromStorage>(_onGetDataFromStorage);
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

  _onGetDataFromStorage(GetDataFromStorage event, Emitter<UserInformationState> emit)async{
    if(await  locator.get<GetUserDataFromStorage>().checkIfUserDataExist(event.email)){
      _userData = await locator.get<GetUserDataFromStorage>().getUserData(event.email);
    }
    emit(UserInformationFillState(
      userData: _userData
    ));
  }

  _onChoiceGender(GenderChoiceEvent event, Emitter<UserInformationState> emit){
    _userData.gender = event.gender;
    emit(UserInformationFillState(
      userData: _userData
    ));
  }
  _onHeightChoiceEvent(HeightChoiceEvent event, Emitter<UserInformationState> emit){
    _userData.height = event.height.ceil();
    emit(UserInformationFillState(
      userData: _userData,
    ));
  }
    _onWeightChoiceEvent(WeightChoiceEvent event, Emitter<UserInformationState> emit){
    _userData.weight = event.weight;
    emit(UserInformationFillState(
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
    emit(UserInformationFillState(
      userData: _userData
    ));
  }

  _onAddAgeEvent(AddAgeEvent event, Emitter<UserInformationState> emit){
    if(_userData.age < 110){
      _userData.age++;
    }
    emit(UserInformationFillState(
      userData: _userData
    ));
  }
  _onRemoveAgeEvent(RemoveAgeEvent event, Emitter<UserInformationState> emit){
    if(_userData.age > 1){
      _userData.age--;
    }
    emit(UserInformationFillState(
      userData: _userData
    ));
  }
  _onAddDaysEvent(AddDaysEvent event, Emitter<UserInformationState> emit){
    if(_userData.daysOfExercise < 7){
      _userData.daysOfExercise++;
    }
    emit(UserInformationFillState(
      userData: _userData
    ));
  }
  _onRemoveDaysEvent(RemoveDaysEvent event, Emitter<UserInformationState> emit){
    if(_userData.daysOfExercise > 0){
      _userData.daysOfExercise--;
    }
    emit(UserInformationFillState(
      userData: _userData
    ));
  }
  _onCalculateCalorie(CalculatCalorie event, Emitter<UserInformationState> emit){
    if(_userData.gender == Gender.male){
      _calorieData.totalKcal = (66 + (13.7 * _userData.weight) + (5*_userData.height) - (6.67 * _userData.age)).ceilToDouble();
      if(_userData.goal == Goal.Gain){
        _calorieData.totalKcal += 300;
      }else if(_userData.goal == Goal.Loss){
        _calorieData.totalKcal -= 250;
      }
      _calorieData.totalKcal += 150 * _userData.daysOfExercise;

    }else{
      _calorieData.totalKcal = (655 + (9.6 * _userData.weight) + (1.8*_userData.height) - (4.7 * _userData.age)).ceilToDouble();
      if(_userData.goal == Goal.Gain){
        _calorieData.totalKcal += 250;
      }else if(_userData.goal == Goal.Loss){
        _calorieData.totalKcal -= 200;
      }
      _calorieData.totalKcal += 125 * _userData.daysOfExercise;
    }
    _calorieData.carbohydrates = ((_calorieData.totalKcal * 0.51)/4).ceilToDouble();
    _calorieData.protein = ((_calorieData.totalKcal * 0.25)/4).ceilToDouble();
    _calorieData.fats = ((_calorieData.totalKcal * 0.24)/9).ceilToDouble();
    locator.get<SaveUserCalorieData>().saveUserCalorieData(_calorieData, event.email);
    locator.get<SaveUserData>().saveUserData(_userData, event.email);
  }
  CalorieData getCalorieDataEvent(){
    return _calorieData;
  }
}
