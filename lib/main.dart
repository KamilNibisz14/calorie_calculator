import 'package:calorie_calculator/features/fill_user_data/presentation/pages/fill_user_data_page.dart';
import 'package:calorie_calculator/features/menu/presentation/pages/main_menu_page.dart';
import 'package:calorie_calculator/features/summary/presentation/pages/summary_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/calculate_day_calories/presentation/bloc/calculate_day_calories_bloc.dart';
import 'features/calculate_day_calories/presentation/pages/calculate_day_calories.dart';
import 'features/fill_user_data/presentation/bloc/user_information_bloc.dart';
import 'features/get_access/presentation/bloc/get_access_bloc.dart';
import 'features/get_access/presentation/pages/get_access_page.dart';
import 'features/menu/presentation/pages/about.dart';
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
      BlocProvider<CalculateDayCaloriesBloc>(
        create: (context) => CalculateDayCaloriesBloc(),
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
      initialRoute: FillUserDataPage.id,
      routes: {
        MainMenuPage.id: (context) => const MainMenuPage(),
        FillUserDataPage.id: (context) => const FillUserDataPage(),
        GetAccessPage.id: (context) => const GetAccessPage(),
        CalculateDayCaloriesPage.id : (context) => const CalculateDayCaloriesPage(),
        AboutPage.id : (context) => const AboutPage(),
        SummaryPage.id : (context) => const SummaryPage()
      },
    );
  }
}
