import 'package:flutter/material.dart';

import 'day_data_pie_chart.dart';

class DayDataWidget extends StatelessWidget {
  DayDataWidget({
    required this.carbohydratesValue,
    required this.fatsValue,
    required this.proteinValue,
    super.key
  });
  double proteinValue;
  double fatsValue;
  double carbohydratesValue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth / 23;
    double dayDataHeight = screenHeight / 8.5;

    int kcal = (4 *carbohydratesValue + 4 * proteinValue + 9 * fatsValue).ceil();  

    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
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
    );
  }
}