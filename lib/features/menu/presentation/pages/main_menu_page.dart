import 'package:calorie_calculator/features/menu/presentation/pages/about.dart';
import 'package:calorie_calculator/features/summary/presentation/pages/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../fill_user_data/presentation/pages/fill_user_data_page.dart';
import '../../../get_access/presentation/bloc/get_access_bloc.dart';
import '../../../get_access/presentation/pages/get_access_page.dart';
import '../widgets/menu_card.dart';


class MainMenuPage extends StatelessWidget {
  static const id = "main_menu_page";
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const[
            Text("Main Menu"),
          ],
        ),
      ),      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuCard(
            iconData: Icons.book, 
            title: "Summary",
            onTap: () => Navigator.pushNamed(context, SummaryPage.id),
          ),
          MenuCard(
            iconData: Icons.person, 
            title: "User data",
            onTap: () => Navigator.pushNamed(context, FillUserDataPage.id),
          ),
          MenuCard(
            iconData: Icons.info_outline, 
            title: "About",
            onTap: () => Navigator.pushNamed(context, AboutPage.id),
          ),
            MenuCard(
            iconData: Icons.logout, 
            title: "Log out",
            onTap: (){
              context.read<GetAccessBloc>().add(LogOutEvent());
              Navigator.pushNamed(context, GetAccessPage.id);
            },
          ),
        ],
      ),
    );
  }
}
