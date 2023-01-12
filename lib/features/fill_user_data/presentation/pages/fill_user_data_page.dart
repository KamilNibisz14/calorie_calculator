import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/gender_choice.dart';
import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/weight_slider.dart';
import 'package:calorie_calculator/features/get_access/presentation/bloc/get_access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_information_bloc.dart';
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
        child: BlocBuilder<UserInformationBloc, UserInformationState>(
          builder: (context, state) {
            if(state is UserInformationInitialState){
              context.read<UserInformationBloc>().add(GetDataFromStorage(email: context.read<GetAccessBloc>().getEmail()));
              return const Center(child: CircularProgressIndicator(),);
            }
            else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  GenderChoice(),
                  HeightSlider(),
                  WeightSlider(),
                  GoalSlider(),
                  AgeAndDaysOfTrainingChoice(),
                  CalculateButton()
                ]
              );
            }
          },
        ),
      ),
    );
  }
}
