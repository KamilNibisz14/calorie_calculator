part of 'summary_bloc.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetDataFromStorage extends SummaryEvent {
  String email;
  GetDataFromStorage({
    required this.email
  });
  @override
  List<Object> get props => [email];
}
