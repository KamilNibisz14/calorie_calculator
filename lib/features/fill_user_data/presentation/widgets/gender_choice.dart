import 'package:calorie_calculator/features/fill_user_data/presentation/bloc/user_information_bloc.dart';
import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/gender_enum.dart';

class GenderChoice extends StatelessWidget {
  const GenderChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const Color activeColor = Color.fromARGB(255, 0, 38, 80);


    return BlocBuilder<UserInformationBloc, UserInformationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context
                    .read<UserInformationBloc>()
                    .add(GenderChoiceEvent(gender: Gender.male));
              },
              child: GenderWidget(
                color: state.userData.gender == Gender.male ? activeColor : Colors.black26,
                icon: Icons.male,
              ),
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<UserInformationBloc>()
                    .add(GenderChoiceEvent(gender: Gender.female));
              },
              child: GenderWidget(
                color:
                    state.userData.gender == Gender.female ? activeColor : Colors.black26,
                icon: Icons.female,
              ),
            )
          ],
        );
      },
    );
  }
}
