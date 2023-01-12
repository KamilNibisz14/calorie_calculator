import 'package:calorie_calculator/core/constants.dart';
import 'package:calorie_calculator/features/summary/presentation/widgets/popUp_day_calorie_data.dart';
import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';

import 'day_data_pie_chart.dart';

// ignore: must_be_immutable
class DayDataWidget extends StatelessWidget {
  DayDataWidget({
    required this.carbohydratesValue,
    required this.fatsValue,
    required this.proteinValue,
    required this.date,
    super.key
  });
  double proteinValue;
  double fatsValue;
  double carbohydratesValue;
  String date;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth / 23;
    double dayDataHeight = screenHeight / 8.5;

    int kcal = (4 *carbohydratesValue + 4 * proteinValue + 9 * fatsValue).ceil();  

    return PopupItemLauncher(
      tag: (date + carbohydratesValue.toString()),
       popUp: PopUpItem(
        padding: const EdgeInsets.all(10),
        color: bottomBarColor, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), 
        elevation: 2,
        tag: (date + proteinValue.toString()), 
        child: PopUpDayCalorieData(
          carbohydratesValue: carbohydratesValue,
          proteinValue: proteinValue,
          fatsValue: fatsValue,
          date: date,
        )
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.white70)
          )
        ),
        height: dayDataHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Expanded(
              child: Text(
                date,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: fontSize
                ),
              )
            ),
            Expanded(
              child: Text(
                "Kcal:  $kcal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize
                ),
              )
            ),
            Expanded(
              child: DayDataPieChart(
                proteinValue: proteinValue,
                fatsValue: fatsValue,
                carbohydratesValue: carbohydratesValue,
              )
            )
          ]
        ),
      ),
    );
  }
}