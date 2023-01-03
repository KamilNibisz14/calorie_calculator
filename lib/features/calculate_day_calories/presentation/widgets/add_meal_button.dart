import 'package:calorie_calculator/core/constants.dart';
import 'package:calorie_calculator/features/calculate_day_calories/presentation/pages/add_meal.dart';
import 'package:flutter/material.dart';

class AddMealButton extends StatelessWidget {
  const AddMealButton({super.key});

  @override
  Widget build(BuildContext context) {

    void _addMeal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddMeal()
          ),
        )
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth/3.8;
    double buttonHeight = buttonWidth/1.7;
    double borderRadius = screenWidth / 20;
    double fontSize = screenWidth / 25;
    return GestureDetector(
      onTap:() => _addMeal(context),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: mainColor.withOpacity(0.65),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(width: 1, color: Colors.white38),
        ),
        child: Center(
          child: Text(
            'Add Meal',
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}