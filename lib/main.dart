import 'package:calorie_calculator/core/constants.dart';
import 'package:calorie_calculator/features/fill_user_data/presentation/pages/fill_user_data_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/calculate_day_calories/presentation/pages/calculate_day_calories.dart';
import 'features/fill_user_data/presentation/bloc/user_information_bloc.dart';
import 'features/get_access/presentation/bloc/get_access_bloc.dart';
import 'features/get_access/presentation/pages/get_access_page.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserInformationBloc>(
        create: (context) => UserInformationBloc(),
      ),
      BlocProvider<GetAccessBloc>(
        create: (context) => GetAccessBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: CalculateDayCaloriesPage.id,
      routes: {
        FillUserDataPage.id: (context) => const FillUserDataPage(),
        GetAccessPage.id: (context) => const GetAccessPage(),
        CalculateDayCaloriesPage.id : (context) => const CalculateDayCaloriesPage(),
      },
    );
  }
}
