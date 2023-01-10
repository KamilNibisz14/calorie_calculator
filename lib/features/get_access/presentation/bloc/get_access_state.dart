part of 'get_access_bloc.dart';

abstract class GetAccessState {
  const GetAccessState();
  
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetAccessInitialState extends GetAccessState{}
class GetAccessInProgressState extends GetAccessState {
  FormOfAccess formOfAccess;
  GetAccessInProgressState({
    required this.formOfAccess
  });
  @override
  List<Object> get props => [formOfAccess];
}
class GetAccessErrorState extends GetAccessState {}
class GetAccessValidState extends GetAccessState {
  FormOfAccess formOfAccess;
  GetAccessValidState({
    required this.formOfAccess
  });
  @override
  List<Object> get props => [formOfAccess];
}
