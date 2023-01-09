import 'package:flutter/material.dart';

import '../widgets/day_data_widget.dart';
import '../widgets/main_pie_chart.dart';

class SummaryPage extends StatelessWidget {
  static const id = "summary_page_id";
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 20;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Counter days: ",
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
              MainPieChart(
                carbohydratesValue: 5,
                proteinValue: 5,
                fatsValue: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DayDataWidget(
                    proteinValue: 5,
                    fatsValue: 5,
                    carbohydratesValue: 5,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}