import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

// ignore: must_be_immutable
class MenuCard extends StatelessWidget {
  MenuCard({
    required this.iconData,
    required this.title,
    required this.onTap,
    super.key
  });
  IconData iconData;
  String title;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth / 13;
    double fontSize = screenWidth / 25;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: menuIconColor)
          )
        ),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                iconData,
                size: iconSize,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}