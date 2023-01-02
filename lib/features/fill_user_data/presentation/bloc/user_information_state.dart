part of 'user_information_bloc.dart';

class UserInformationState {
  UserData userData;
  UserInformationState({
    required this.userData
  });
  List<Object> get props => [userData];
}
