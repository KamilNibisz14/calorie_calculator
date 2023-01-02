import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderWidget extends StatelessWidget {
  GenderWidget({
    required this.color,
    required this.icon,
    Key? key
    }) : super(key: key);
  Color color;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double genderWidgetSize = width /3.5;
    double genderWidgetBorderRadius = width / 20;
    double iconSize  = width / 9;
    return Container(
      width: genderWidgetSize,
      height: genderWidgetSize,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1, color: Colors.white38),
        borderRadius: BorderRadius.circular(genderWidgetBorderRadius),
      ),
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}
