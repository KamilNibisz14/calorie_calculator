import 'package:calorie_calculator/features/get_access/presentation/bloc/get_access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../domain/form_of_access_enum.dart';

class GetAccessButton extends StatelessWidget {
  const GetAccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double genderWidgetBorderRadius = screenWidth / 20;
    double buttonWidth = screenWidth / 3.4;
    double buttonHeight = buttonWidth / 2.5;
    double textSize = screenWidth / 22;
    String buttonText = "Login";
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, right: 20),
      child: GestureDetector(
        onTap: () => context.read<GetAccessBloc>().add(GetAccess()),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white38),
            borderRadius: BorderRadius.circular(genderWidgetBorderRadius),
            color: mainColor.withOpacity(0.65),
          ),
          child: Center(
            child: BlocBuilder<GetAccessBloc, GetAccessState>(
              builder: (context, state) {
                if(state is GetAccessInProgressState){
                  state.formOfAccess == FormOfAccess.Login? buttonText = "Login":"Register";
                  return Text(
                    state.formOfAccess == FormOfAccess.Login?"Login":"Register",
                    style: TextStyle(fontSize: textSize),
                  );
                }
                else{
                  return Text(
                    buttonText,
                    style: TextStyle(fontSize: textSize),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
