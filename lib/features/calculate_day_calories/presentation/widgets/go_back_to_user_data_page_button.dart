import 'package:calorie_calculator/core/constants.dart';
import 'package:calorie_calculator/features/fill_user_data/presentation/pages/fill_user_data_page.dart';
import 'package:flutter/material.dart';

class BackUserButtonButton extends StatelessWidget {
  const BackUserButtonButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 20;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, FillUserDataPage.id),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        margin: const EdgeInsets.only(top: 75),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset:const  Offset(5, 5),
          ),
        ],
        ),
        child: Text(
          "User Data",
          style: TextStyle(
            fontSize: fontSize
          ),
        ),
      ),
    );
  }
}