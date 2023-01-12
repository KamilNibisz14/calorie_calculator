import 'package:calorie_calculator/features/get_access/presentation/bloc/get_access_bloc.dart';
import 'package:calorie_calculator/features/menu/presentation/pages/main_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../fill_user_data/presentation/pages/fill_user_data_page.dart';
import '../bloc/calculate_day_calories_bloc.dart';
import '../widgets/calorie_counter_widget.dart';
import '../widgets/go_back_to_user_data_page_button.dart';
import '../widgets/meals_in_days.dart';

class CalculateDayCaloriesPage extends StatelessWidget {
  static const id = "calculate_day_calories_page";
  const CalculateDayCaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth / 14;
    double errorTextFontSize = screenWidth / 18;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CalculateDayCaloriesBloc, CalculateDayCaloriesState>(
          builder: (context, state) {
            if(state is CalculateDayCaloriesInitial){
              context.read<CalculateDayCaloriesBloc>().add(GetCalorieDataFromStorage(email: context.read<GetAccessBloc>().getEmail()));
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is FailToGetDataFromStorage){
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Failed to get data from storage get back to user data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: errorTextFontSize
                      ),
                    ),
                    BackUserButtonButton()
                  ],
                ),
              );
            }
            else{
              return Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: MealInDays(),
                    ),
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
                        onTap: () {
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
              );
            }
          },
        ),
      ),
    );
  }
}
