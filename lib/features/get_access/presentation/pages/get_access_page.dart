import 'package:calorie_calculator/features/get_access/domain/form_of_access_enum.dart';
import 'package:calorie_calculator/features/get_access/presentation/bloc/get_access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../calculate_day_calories/presentation/pages/calculate_day_calories.dart';
import '../../../fill_user_data/presentation/pages/fill_user_data_page.dart';
import '../widgets/form.dart';
import '../widgets/get_access_button.dart';

class GetAccessPage extends StatelessWidget {
  static const String id = "get_access_page";
  const GetAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAccessBloc, GetAccessState>(
      listener: (context, state) {
        if(state is GetAccessValidState){
          if(state.formOfAccess == FormOfAccess.Register){
            Navigator.pushNamed(context, FillUserDataPage.id);
          }
          else{
            Navigator.pushNamed(context, CalculateDayCaloriesPage.id);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: const [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: GetAccessForm(),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: GetAccessButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
