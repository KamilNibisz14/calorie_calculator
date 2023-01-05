import 'package:calorie_calculator/features/menu/presentation/pages/about.dart';
import 'package:flutter/material.dart';

import '../../../fill_user_data/presentation/pages/fill_user_data_page.dart';
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
          children: [
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
            onTap: (){},
          ),
          MenuCard(
            iconData: Icons.boy_rounded, 
            title: "Body measurements",
            onTap: (){},
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
        ],
      ),
    );
  }
}
