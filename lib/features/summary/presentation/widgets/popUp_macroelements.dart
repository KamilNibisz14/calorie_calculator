import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopUpMacroelement extends StatelessWidget {
   
  PopUpMacroelement({
    required this.title,
    required this.value,
    super.key
  });

  String title;
  double value;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 27;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        )
      ],
    );
  }
}