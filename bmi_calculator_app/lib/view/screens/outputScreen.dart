import 'package:flutter/material.dart';

class BMIResult extends StatefulWidget
{
  @override
  _BMIResultState createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculation Result",
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
              "Your Result Goes Here"
          ),
        ),
      ),
    );
  }
}
