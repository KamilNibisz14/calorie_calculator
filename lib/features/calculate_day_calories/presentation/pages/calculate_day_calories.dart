import 'package:calorie_calculator/features/menu/presentation/pages/main_menu_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../widgets/calorie_counter_widget.dart';
import '../widgets/meals_in_days.dart';

class CalculateDayCaloriesPage extends StatelessWidget {
  static const id = "calculate_day_calories_page";
  const CalculateDayCaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth /14;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[
            const Align(
              alignment: Alignment.center,
              child: MealInDays(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CalorieCounterWidget(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, MainMenuPage.id);
                  },
                  child: Icon(
                    Icons.menu,
                    size: iconSize,
                    color: menuIconColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}