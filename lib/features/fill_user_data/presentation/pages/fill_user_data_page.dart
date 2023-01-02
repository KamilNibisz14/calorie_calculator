import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/gender_choice.dart';
import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/weight_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/age_and_days_of_training_choice.dart';
import '../widgets/calculate_button.dart';
import '../widgets/goal_slider.dart';
import '../widgets/height_slider.dart';

class FillUserDataPage extends StatelessWidget {
  static const String id = "fill_user_data_page";
  const FillUserDataPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              GenderChoice(),
              HeightSlider(),
              WeightSlider(),
              GoalSlider(),
              AgeAndDaysOfTrainingChoice(),
              CalculateButton()
            ]
          ),
        ),
      ),
    );
  }
}
