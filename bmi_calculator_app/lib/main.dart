import 'package:bmi_calculator_app/view/screens/homeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0E21),
          textTheme: TextTheme(
              body1: TextStyle(
                  color: Colors.white
              )
          )
      ),
      home: HomeScreen(),
    );
  }
}


