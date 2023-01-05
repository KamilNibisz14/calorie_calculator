import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const id = "about_page";
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 20;
    String text = "A simple calorie calculator. after completing your data, the daily caloric requirement will be calculated. The data can be changed in the user data section in the main menu. In the summary section, we have our previous days and a summary of all activity. At section. Body measurements are saved by user changes";
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
            Text("About"),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: fontSize
          ),
        ),
      ),      
    );
  }
}