import 'package:calorie_calculator/features/fill_user_data/presentation/bloc/user_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/entities/goal_enum.dart';

class GoalSlider extends StatelessWidget {
  const GoalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double sliderWidth = width * 0.95;
    double textSize = width / 22;

    const double textMarginLeft = 25;
    const double heightTextMarginLeft = 10;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlocBuilder<UserInformationBloc, UserInformationState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: textMarginLeft),
                    child: Text(
                      'Goal:',
                      style: TextStyle(fontSize: textSize),
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: heightTextMarginLeft),
                    child: Text(
                      "${state.userData.goal.name} weight",
                      style: TextStyle(fontSize: textSize),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: sliderWidth,
                child: Slider(
                  onChanged: (double value) {
                    context.read<UserInformationBloc>().add(GoalChoiceEvent(goal: value.ceil()));
                  },
                  divisions: 2,
                  value: state.userData.goal == Goal.Gain?2:state.userData.goal == Goal.Maintain?1:0,
                  min: 0,
                  max: 2,
                  activeColor: mainColor,
                  inactiveColor: mainColor.withOpacity(0.3),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}