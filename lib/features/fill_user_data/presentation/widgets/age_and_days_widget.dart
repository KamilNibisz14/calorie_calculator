import 'package:calorie_calculator/features/fill_user_data/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgeAndDaysWidget extends StatelessWidget {
  AgeAndDaysWidget({
    super.key,
    required this.addAction,
    required this.removeAction,
    required this.text,
    required this.title
    });

  String title;
  VoidCallback removeAction;
  VoidCallback addAction;
  String text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double genderWidgetBorderRadius = width / 20;
    double widgetSize = width/3;
    double textSize = width / 23;
    return Container(
      height: widgetSize,
      width: widgetSize,
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(width: 1, color: Colors.white38),
        borderRadius: BorderRadius.circular(genderWidgetBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: textSize,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: removeAction,
                    child: Button(icon: Icons.remove,)
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: textSize
                    ),
                  ),
                  GestureDetector(
                    onTap: addAction,
                    child: Button(icon: Icons.add,)
                    ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}