import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBarKcalWidget extends StatelessWidget {
 BottomBarKcalWidget({
    super.key,
    required this.maxValue,
    required this.name,
    required this.value,
    required this.color,
    required this.unit,
  });

  String name;
  String unit;
  double value;
  double maxValue;
  Color color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 33;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LinearProgressIndicator(
            value: value / maxValue,
            color: value / maxValue > 1? Colors.redAccent : color,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "$name: ",
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.white70
                    ),
                  ),
                  Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: fontSize
                    ),
                  ),
                ],
              ),
              Text(
                "/ ${maxValue.ceil()} $unit",
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white70
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}