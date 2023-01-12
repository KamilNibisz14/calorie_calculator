part of 'user_information_bloc.dart';

abstract class UserInformationState {
  UserData userData;
  UserInformationState({
    required this.userData
  });
  List<Object> get props => [userData];
}

class UserInformationInitialState extends UserInformationState{
  UserInformationInitialState({
    required super.userData
  });
  @override
  List<Object> get props => [userData];
}

class UserInformationFillState extends UserInformationState{
  UserInformationFillState({
    required super.userData
  });
  @override
  List<Object> get props => [userData];
}

