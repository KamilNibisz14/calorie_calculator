import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/constants.dart';
import '../../../../core/entities/macroelement_enum.dart';
import '../bloc/calculate_day_calories_bloc.dart';

// ignore: must_be_immutable
class FillMacroelement extends StatelessWidget {
  FillMacroelement({required this.macroelement, super.key});
  Macroelement macroelement;

  @override
  Widget build(BuildContext context) {
    double screenwWdth = MediaQuery.of(context).size.width;
    double screenwHeight = MediaQuery.of(context).size.height;
    double fontSize = screenwWdth / 32;
    double textFormFieldHeight = screenwHeight / 9.5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            macroelement.name,
            style: TextStyle(fontSize: fontSize),
          ),
          SizedBox(
              height: textFormFieldHeight,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: fillMacroelementInputDecoration,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.numeric(errorText: 'Invalid')]),
                onChanged: (value) {
                  if(double.tryParse(value)!= null && value !='0'){
                    if (macroelement == Macroelement.carbohydrates) {
                      context.read<CalculateDayCaloriesBloc>().add(AddCarbohydretsInMeal(carbohydrates: double.parse(value)));
                    } else if (macroelement == Macroelement.fats) {
                      context.read<CalculateDayCaloriesBloc>().add(AddFatsInMeal(fats: double.parse(value)));
                    } else if (macroelement == Macroelement.protein) {
                      context.read<CalculateDayCaloriesBloc>().add(AddProteinInMeal(protein: double.parse(value)));
                    }
                  }
                },
              ))
        ],
      ),
    );
  }
}
