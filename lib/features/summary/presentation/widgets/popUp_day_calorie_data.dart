import 'package:calorie_calculator/features/summary/presentation/widgets/main_pie_chart.dart';
import 'package:calorie_calculator/features/summary/presentation/widgets/popUp_macroelements.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopUpDayCalorieData extends StatelessWidget {
  PopUpDayCalorieData({
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
    double fontSize = screenWidth / 24;
    int kcal = (4 *carbohydratesValue + 4 * proteinValue + 9 * fatsValue).ceil();  
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              Text(
                "Kcal: $kcal",
                style: TextStyle(
                  fontSize: fontSize
                ),
              )
            ],
           ),
           MainPieChart(
            carbohydratesValue: carbohydratesValue, 
            fatsValue: fatsValue, 
            proteinValue: proteinValue
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white70, width: 1)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PopUpMacroelement(
                  title: "Protein:",
                  value: proteinValue,
                ),
                PopUpMacroelement(
                  title: "Fats:", 
                  value: fatsValue
                ),
                PopUpMacroelement(
                  title: "Carbo:", 
                  value: carbohydratesValue
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}