import 'package:calorie_calculator/features/fill_user_data/presentation/bloc/user_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double genderWidgetBorderRadius = width / 20;
    double buttonWidth = width / 3.4;
    double buttonHeight = buttonWidth / 2.5;
    double textSize = width / 22;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: BlocListener<UserInformationBloc, UserInformationState>(
            listener: (context, state) {
            },
            child: GestureDetector(
              onTap: (){
                context.read<UserInformationBloc>().add(CalculatCalorie());
              },
              child: Container(
                width: buttonWidth,
                height: buttonHeight,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.65),
                  border: Border.all(width: 1, color: Colors.white38),
                  borderRadius: BorderRadius.circular(genderWidgetBorderRadius),
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}