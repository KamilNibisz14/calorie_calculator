import 'package:bloc/bloc.dart';
import 'package:calorie_calculator/features/get_access/data/check_if_user_is_correct.dart';
import 'package:calorie_calculator/features/get_access/data/register_new_user.dart';
import 'package:calorie_calculator/features/get_access/domain/form_of_access_enum.dart';
import 'package:calorie_calculator/locator.dart';
import 'package:equatable/equatable.dart';

import '../../domain/user_data.dart';

part 'get_access_event.dart';
part 'get_access_state.dart';

class GetAccessBloc extends Bloc<GetAccessEvent, GetAccessState> {
  FormOfAccess _formOfAccess = FormOfAccess.Login;
  late final UserData _userData = UserData();
  GetAccessBloc() : super(GetAccessInProgressState(formOfAccess: FormOfAccess.Login)) {
    on<GetAccessEvent>((event, emit) {
    });
    on<ChangeFormOfAccess>(_onChangeFormOfAccess);
    on<GetEmail>(_onGetEmail);
    on<GetPassword>(_onGetPassword);
    on<GetAccess>(_onGetAccess);
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
    bool isLogged = false;
    if(_formOfAccess == FormOfAccess.Login){
      isLogged = await locator.get<CheckLogin>().ckeckIfLoginIsValid(_userData);
    }
    else{
      isLogged = await locator.get<RegisterUser>().registerUser(_userData);
    }
    if(isLogged){
      emit(GetAccessValidState());
    }
    else{
      emit(GetAccessErrorState());
    }
  }
  FormOfAccess getFormOfAccess(){
    return _formOfAccess;
  }

}
