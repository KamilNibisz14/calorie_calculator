import 'package:calorie_calculator/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


// ignore: must_be_immutable
class MainPieChart extends StatelessWidget {
  MainPieChart({
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

    double finalValue = carbohydratesValue + proteinValue + fatsValue;

    final dataMap = <String, double>{
      "Protein": proteinValue,
      "Fats": fatsValue,
      "Carbohydrates": carbohydratesValue,
    };
    final colorList = <Color>[
      proteinColor,
      fatsColor,
      carbohydratesColor,
    ];
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 30),
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.disc,
        baseChartColor: Colors.grey[50]!.withOpacity(0.15),
        colorList: colorList,
        legendOptions: const LegendOptions(
          legendPosition: LegendPosition.right
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
          decimalPlaces: 2
        ),
        totalValue: finalValue,
      ),
    );
  }
}