import 'package:calorie_calculator/features/get_access/domain/form_of_access_enum.dart';
import 'package:calorie_calculator/features/get_access/presentation/bloc/get_access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/constants.dart';
import '../../../fill_user_data/presentation/pages/fill_user_data_page.dart';

class GetAccessForm extends StatelessWidget {
  const GetAccessForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth / 1.25;
    double buttonFontSize = screenWidth / 25;
    double errorTextSize = screenWidth / 22;
    String buttonText = "Login";
    return Center(
      child: SizedBox(
        width: textFieldWidth,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: BlocBuilder<GetAccessBloc, GetAccessState>(
                  builder: (context, state) {
                    if(state is GetAccessErrorState){
                       return Text(
                        'email or password invalid',
                        style: TextStyle(
                            fontSize: errorTextSize, color: Colors.redAccent),
                      );
                    }else{
                      return Text(
                        '',
                        style: TextStyle(
                            fontSize: errorTextSize, color: Colors.redAccent),
                      );
                    }
                  },
                ),
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: getAccessInputDecoration.copyWith(
                  hintText: "Enter your email",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(errorText: 'Email invalid'),
                ]),
                onChanged: (value) {
                  context.read<GetAccessBloc>().add(GetEmail(email: value));
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: getAccessInputDecoration.copyWith(
                    hintText: "Enter your password",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                  onChanged: (value) {
                    context
                        .read<GetAccessBloc>()
                        .add(GetPassword(password: value));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.white70))),
                    margin: const EdgeInsets.only(top: 20),
                    child: BlocBuilder<GetAccessBloc, GetAccessState>(
                      builder: (context, state) {
                        if (state is GetAccessInProgressState) {
                          state.formOfAccess == FormOfAccess.Login
                              ? buttonText = "Register"
                              : "Login";
                          return GestureDetector(
                            onTap: () => context
                                .read<GetAccessBloc>()
                                .add(ChangeFormOfAccess()),
                            child: Text(
                              state.formOfAccess == FormOfAccess.Login
                                  ? "Register"
                                  : "Login",
                              style: TextStyle(
                                  fontSize: buttonFontSize,
                                  color: Colors.white70),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () => context
                                .read<GetAccessBloc>()
                                .add(ChangeFormOfAccess()),
                            child: Text(
                              buttonText,
                              style: TextStyle(
                                  fontSize: buttonFontSize,
                                  color: Colors.white70),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
