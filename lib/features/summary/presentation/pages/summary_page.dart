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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Summary"),
          ],
        ),
      ),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DayDataWidget(
                        proteinValue: 100,
                        fatsValue: 100,
                        carbohydratesValue: 500,
                        date: DateTime.now().toString().substring(0,10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}