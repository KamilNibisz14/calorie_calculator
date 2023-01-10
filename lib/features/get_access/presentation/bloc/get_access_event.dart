part of 'get_access_bloc.dart';

abstract class GetAccessEvent extends Equatable {
  const GetAccessEvent();

  @override
  List<Object> get props => [];
}
// ignore: must_be_immutable
class GetEmail extends GetAccessEvent{
  String email;
  GetEmail({
    required this.email
  });
  @override
  List<Object> get props => [email];
}
// ignore: must_be_immutable
class GetPassword extends GetAccessEvent{
  String password;
  GetPassword({
    required this.password
  });
  @override
  List<Object> get props => [password];
}
class GetDataFromStorageEvent extends GetAccessEvent{}

class ChangeFormOfAccess extends GetAccessEvent{}

class GetAccess extends GetAccessEvent{}

class LogOutEvent extends GetAccessEvent{}
