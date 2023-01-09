import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../core/constants.dart';

// ignore: must_be_immutable
class DayDataPieChart extends StatelessWidget {
  DayDataPieChart({
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

    return PieChart(
      dataMap: dataMap,
      chartType: ChartType.ring,
      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
      colorList: colorList,
      legendOptions: const LegendOptions(
        showLegends: false
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false
      ),
      totalValue: finalValue,
    );
  }
}