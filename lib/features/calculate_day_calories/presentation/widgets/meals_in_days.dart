import 'package:calorie_calculator/features/calculate_day_calories/presentation/bloc/calculate_day_calories_bloc.dart';
import 'package:calorie_calculator/features/calculate_day_calories/presentation/widgets/add_meal_button.dart';
import 'package:calorie_calculator/features/calculate_day_calories/presentation/widgets/macroelement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/calorie_data.dart';

class MealInDays extends StatelessWidget {
  const MealInDays({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double mealsWidgetWidth = screenWidth;
    double titleFontSize = screenWidth / 20;
    double mealContainerHeight = screenWidth /3;
    double heightOfBottonBar = screenWidth / 6;
    double iconSize = screenWidth / 18;


    List<Container> getMeals(List<CalorieData> meals){
      List<Container> listOfMeals = [];

      for(int i = 0; i < meals.length; ++i){
        listOfMeals.add(
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: Colors.white54)
              )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: mealsWidgetWidth,
            height: mealContainerHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meal ${i+1}: ",
                        style: TextStyle(
                          fontSize: titleFontSize,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          context.read<CalculateDayCaloriesBloc>().add(RemoveMealEvent(index: i));
                        },
                        child: Icon(
                          Icons.cancel_rounded,
                          color: Colors.redAccent,
                          size: iconSize,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: MacroelementViewWidget(title: "Kcal",value: meals[i].totalKcal,),),
                      Expanded(child: MacroelementViewWidget(title: "Prote",value: meals[i].protein,),),
                      Expanded(child: MacroelementViewWidget(title: "Fats",value: meals[i].fats,),),
                      Expanded(child: MacroelementViewWidget(title: "Carbo",value: meals[i].carbohydrates,),),
                    ],
                  ),
                )
              ],
            ),
          )
        );
      }

      return listOfMeals;
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CalculateDayCaloriesBloc, CalculateDayCaloriesState>(
            builder: (context, state) {
              return Column(
                children: getMeals(state.meals),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: AddMealButton(),
          ),
          SizedBox(height: heightOfBottonBar)
        ],
      ),
    );
  }
}
