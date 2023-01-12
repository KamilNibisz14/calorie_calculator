import 'package:calorie_calculator/features/get_access/presentation/bloc/get_access_bloc.dart';
import 'package:calorie_calculator/features/summary/presentation/bloc/summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/summary_data.dart';
import '../widgets/day_data_widget.dart';
import '../widgets/main_pie_chart.dart';

class SummaryPage extends StatelessWidget {
  static const id = "summary_page_id";
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<DayDataWidget> getdayDataWidgets(List<SummaryData> summary){
      List<DayDataWidget> dayDataWidgets = [];
      for(int i = 0; i < summary.length; ++i){
        dayDataWidgets.add(
          DayDataWidget(
            carbohydratesValue: summary[i].calorieData.carbohydrates, 
            fatsValue: summary[i].calorieData.fats, 
            proteinValue: summary[i].calorieData.protein, 
            date: summary[i].data
          )
        );
      }
      return dayDataWidgets;

    }

    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 20;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text("Summary"),
          ],
        ),
      ),
      body: BlocBuilder<SummaryBloc, SummaryState>(
        builder: (context, state) {
          if(state is SummaryInitial){
            context.read<SummaryBloc>().add(GetDataFromStorage(email: context.read<GetAccessBloc>().getEmail()));
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is SummaryShowState){
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Counter days: ${context.read<SummaryBloc>().counterDays()}",
                      style: TextStyle(fontSize: fontSize),
                    ),
                    MainPieChart(
                      carbohydratesValue: state.mainCalorieData.carbohydrates,
                      proteinValue: state.mainCalorieData.protein,
                      fatsValue: state.mainCalorieData.fats,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: getdayDataWidgets(state.summaryData)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else{
            return Center(
              child: Text(
                'Summary Not Found',
                style: TextStyle(
                  fontSize: fontSize,
                ),
            ),);
          }
        },
      ),
    );
  }
}
