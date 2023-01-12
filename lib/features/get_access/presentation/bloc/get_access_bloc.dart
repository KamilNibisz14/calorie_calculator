import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/features/get_access/data/check_if_user_is_correct.dart';
import 'package:calorie_calculator/features/get_access/data/register_new_user.dart';
import 'package:calorie_calculator/features/get_access/domain/entities/form_of_access_enum.dart';
import 'package:calorie_calculator/locator.dart';
import 'package:equatable/equatable.dart';

import '../../data/user_access_data_storage.dart';
import '../../domain/entities/user_data.dart';

part 'get_access_event.dart';
part 'get_access_state.dart';

class GetAccessBloc extends Bloc<GetAccessEvent, GetAccessState> {
  FormOfAccess _formOfAccess = FormOfAccess.Login;
  late GetAccessUserData _userData = GetAccessUserData();
  GetAccessBloc() : super(GetAccessInitialState()) {
    on<GetAccessEvent>((event, emit) {
    });
    on<ChangeFormOfAccess>(_onChangeFormOfAccess);
    on<GetEmail>(_onGetEmail);
    on<GetPassword>(_onGetPassword);
    on<GetAccess>(_onGetAccess);
    on<GetDataFromStorageEvent>(_onGetDataFromStorageEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }
  _onChangeFormOfAccess(ChangeFormOfAccess event, Emitter<GetAccessState> emit){
    if(_formOfAccess == FormOfAccess.Login){
      _formOfAccess = FormOfAccess.Register;
    }else{
      _formOfAccess = FormOfAccess.Login;
    }
    emit(GetAccessInProgressState(
      formOfAccess: _formOfAccess
    ));
  }
  _onGetEmail(GetEmail event, Emitter<GetAccessState> emit){
    _userData.email = event.email;
  }
  _onGetPassword(GetPassword event, Emitter<GetAccessState> emit){
    _userData.password = event.password;
  }
  _onGetAccess(GetAccess event, Emitter<GetAccessState> emit)async{
    if(await isUserDataCorrect()){
      locator.get<UserAccessDataStorage>().setUserAccessData(_userData);
      emit(GetAccessValidState(formOfAccess: _formOfAccess));
    }
    else{
      emit(GetAccessErrorState());
    }
  }

  _onGetDataFromStorageEvent(GetDataFromStorageEvent event, Emitter<GetAccessState> emit)async{
   _userData = locator.get<UserAccessDataStorage>().getUserAccessData();
   if(_userData.email == null){
    emit(GetAccessInProgressState(
      formOfAccess: _formOfAccess
    ));
   }
   else{
    if(await isUserDataCorrect()){
      emit(GetAccessValidState(formOfAccess: _formOfAccess));
    }else{
      emit(GetAccessErrorState());
    }
   }
  }
  _onLogOutEvent(LogOutEvent event, Emitter<GetAccessState> emit){
    _userData.email = null;
    _userData.password = null;
    _formOfAccess = FormOfAccess.Login;
    locator.get<UserAccessDataStorage>().logout();
    emit(GetAccessInProgressState(
      formOfAccess: _formOfAccess
    ));
  }
  FormOfAccess getFormOfAccess(){
    return _formOfAccess;
  }

  Future<bool> isUserDataCorrect()async{
    bool isLogged = false;
    if(_formOfAccess == FormOfAccess.Login){
      isLogged = await locator.get<CheckLogin>().ckeckIfLoginIsValid(_userData);
    }
    else{
      isLogged = await locator.get<RegisterUser>().registerUser(_userData);
    }
    return isLogged;
  }
  String getEmail(){
    return _userData.email!;
  }

}
