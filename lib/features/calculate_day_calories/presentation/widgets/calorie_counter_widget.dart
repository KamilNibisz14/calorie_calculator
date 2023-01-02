import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'botoom_bar_kcal_widget.dart';

class CalorieCounterWidget extends StatelessWidget {
  const CalorieCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heightOfBottonBar = width / 6;
    return Container(
      height: heightOfBottonBar,
      width: double.infinity,
      color: Colors.black12,
      child: Row(
        children: [
          Expanded(
            child: BottomBarKcalWidget(
              name: "Kcal",
              unit: "kcal",
              value: 1000,
              maxValue: 2000,
              color: mainColor,
            )
          ),
          Expanded(
            child: BottomBarKcalWidget(
              name: "Prote",
              unit: "g",
              value: 1000,
              maxValue: 2000,
              color: Colors.lightBlue,
            )
          ),
          Expanded(
            child: BottomBarKcalWidget(
              name: "Fats",
              unit: "g",
              value: 1000,
              maxValue: 2000,
              color: Colors.amberAccent,
            )
          ),
          Expanded(
            child: BottomBarKcalWidget(
              name: "Carbo",
              unit: "g",
              value: 1000,
              maxValue: 2000,
              color: Colors.purple,
            )
          ),
        ],
      ),
    );
  }
}