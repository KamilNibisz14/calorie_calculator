part of 'summary_bloc.dart';

abstract class SummaryState{
  const SummaryState();

  List<Object> get props => [];
}

class SummaryInitial extends SummaryState {}

class SummaryShowState extends SummaryState{
  CalorieData mainCalorieData;
  List<SummaryData> summaryData;
  SummaryShowState({
    required this.summaryData,
    required this.mainCalorieData
  });
  @override
  List<Object> get props => [summaryData,mainCalorieData];
}
class SummaryIsEmptyState extends SummaryState{}
