import 'package:flutter/material.dart';

import '../widgets/calorie_counter_widget.dart';

class CalculateDayCaloriesPage extends StatelessWidget {
  static const id = "calculate_day_calories_page";
  const CalculateDayCaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CalorieCounterWidget(),
            )
          ],
        ),
      ),
    );
  }
}