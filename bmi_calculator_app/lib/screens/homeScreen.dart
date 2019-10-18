import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(Color(CARD_BACKGROUND_COLOR)),
                  ),
                  Expanded(
                    child: InputCard(Color(CARD_BACKGROUND_COLOR)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(Color(CARD_BACKGROUND_COLOR)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(Color(CARD_BACKGROUND_COLOR)),
                  ),
                  Expanded(
                    child: InputCard(Color(CARD_BACKGROUND_COLOR)),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: CALCULATE_BUTTON_HEIGHT,
              margin: EdgeInsets.only(top: 10.0),
              color: Color(CALCULATE_BUTTON_COLOR),
            )
          ],
        ),
      ),
    );
  }
}

class InputCard extends StatelessWidget {

  final Color color;

  InputCard(this.color);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}