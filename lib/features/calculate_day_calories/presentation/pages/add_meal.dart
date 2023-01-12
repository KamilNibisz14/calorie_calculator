import 'package:calorie_calculator/core/entities/macroelement_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculate_day_calories_bloc.dart';
import '../widgets/fill_macroelements.dart';

class AddMeal extends StatelessWidget {
  const AddMeal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth / 15;
    return BlocBuilder<CalculateDayCaloriesBloc, CalculateDayCaloriesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<CalculateDayCaloriesBloc>()
                          .add(CancelAddMealEvent());
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_rounded,
                      color: Colors.redAccent,
                      size: iconSize,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<CalculateDayCaloriesBloc>()
                          .add(AddMealEvent());
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.green,
                      size: iconSize,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: FillMacroelement(
                  macroelement: Macroelement.protein,
                )),
                Expanded(
                    child: FillMacroelement(
                  macroelement: Macroelement.fats,
                )),
                Expanded(
                    child: FillMacroelement(
                  macroelement: Macroelement.carbohydrates,
                )),
              ],
            ),
          ],
        );
      },
    );
  }
}
