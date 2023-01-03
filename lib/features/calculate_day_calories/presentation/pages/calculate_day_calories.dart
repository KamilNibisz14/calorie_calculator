import 'package:flutter/material.dart';

import '../widgets/calorie_counter_widget.dart';
import '../widgets/meals_in_days.dart';

class CalculateDayCaloriesPage extends StatelessWidget {
  static const id = "calculate_day_calories_page";
  const CalculateDayCaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            Align(
              alignment: Alignment.bottomCenter,
              child: CalorieCounterWidget(),
            ),
            Align(
              alignment: Alignment.center,
              child: MealInDays(),
            ),
          ],
        ),
      ),
    );
  }
}