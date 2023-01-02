import 'package:calorie_calculator/features/fill_user_data/presentation/bloc/user_information_bloc.dart';
import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/age_and_days_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeAndDaysOfTrainingChoice extends StatelessWidget {
  const AgeAndDaysOfTrainingChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInformationBloc, UserInformationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AgeAndDaysWidget(
              title: "Age",
              text: state.userData.age.toString(),
              removeAction:() => context.read<UserInformationBloc>().add(RemoveAgeEvent()),
              addAction: () => context.read<UserInformationBloc>().add(AddAgeEvent())
            ),
            AgeAndDaysWidget(
              title: "Training days",
              text: state.userData.daysOfExercise.toString(),
              removeAction:() => context.read<UserInformationBloc>().add(RemoveDaysEvent()),
              addAction: () => context.read<UserInformationBloc>().add(AddDaysEvent())
            ),
          ],
        );
      },
    );
  }
}
