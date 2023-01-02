import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    super.key,
    required this.icon,
    });
  IconData icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double buttonSize = width /13;
    double iconSize = width /20;
    return Container(
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: mainColor.withOpacity(0.6),
      ),
      child: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}