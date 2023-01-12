part of 'user_information_bloc.dart';

abstract class UserInformationEvent extends Equatable {
  const UserInformationEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetDataFromStorage extends UserInformationEvent{
  String email;
  GetDataFromStorage({
    required this.email
  });
  @override
  List<Object> get props => [email];
}

// ignore: must_be_immutable
class GenderChoiceEvent extends UserInformationEvent{
  Gender gender;
  GenderChoiceEvent({
    required this.gender
  });
  @override
  List<Object> get props => [gender];
}
// ignore: must_be_immutable
class HeightChoiceEvent extends UserInformationEvent{
  double height;
  HeightChoiceEvent({
    required this.height
  });
  @override
  List<Object> get props => [height];
}
// ignore: must_be_immutable
class WeightChoiceEvent extends UserInformationEvent{
  double weight;
  WeightChoiceEvent({
    required this.weight
  });
  @override
  List<Object> get props => [weight];
}

// ignore: must_be_immutable
class GoalChoiceEvent extends UserInformationEvent{
  int goal;
  GoalChoiceEvent({
    required this.goal
  });
  @override
  List<Object> get props => [goal];
}

class AddAgeEvent extends UserInformationEvent{}
class RemoveAgeEvent extends UserInformationEvent{}
class AddDaysEvent extends UserInformationEvent{}
class RemoveDaysEvent extends UserInformationEvent{}
// ignore: must_be_immutable
class CalculatCalorie extends UserInformationEvent{
  String email;
  CalculatCalorie({
    required this.email
  });
  @override
  List<Object> get props => [email];
}
