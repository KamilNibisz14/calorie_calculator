import 'package:calorie_calculator/features/calculate_day_calories/presentation/bloc/calculate_day_calories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import 'botoom_bar_kcal_widget.dart';

class CalorieCounterWidget extends StatelessWidget {
  const CalorieCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heightOfBottonBar = width / 6;
    return Container(
      height: heightOfBottonBar,
      width: double.infinity,
      color: Colors.black12,
      child: BlocBuilder<CalculateDayCaloriesBloc, CalculateDayCaloriesState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  child: BottomBarKcalWidget(
                name: "Kcal",
                unit: "kcal",
                value: state.caloriesThroughoutTheDay.totalKcal,
                maxValue: state.calorieData.totalKcal,
                color: mainColor,
              )),
              Expanded(
                  child: BottomBarKcalWidget(
                name: "Prote",
                unit: "g",
                value: state.caloriesThroughoutTheDay.protein,
                maxValue: state.calorieData.protein,
                color: Colors.lightBlue,
              )),
              Expanded(
                  child: BottomBarKcalWidget(
                name: "Fats",
                unit: "g",
                value: state.caloriesThroughoutTheDay.fats,
                maxValue: state.calorieData.fats,
                color: Colors.amberAccent,
              )),
              Expanded(
                  child: BottomBarKcalWidget(
                name: "Carbo",
                unit: "g",
                value: state.caloriesThroughoutTheDay.carbohydrates,
                maxValue: state.calorieData.carbohydrates,
                color: Colors.purple,
              )),
            ],
          );
        },
      ),
    );
  }
}
