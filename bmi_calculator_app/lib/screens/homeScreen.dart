import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    child: InputCard(
                      color: Color(CARD_BACKGROUND_COLOR),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: INPUT_CARD_ICON_SIZE,
                          ),
                          SizedBox(
                            height: DEFAULT_SPACE,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                              color: Color(CARD_TEXT_COLOR)
                            ),
                          )
                        ],
                      ),

                    ),
                  ),
                  Expanded(
                    child: InputCard(
                      color: Color(CARD_BACKGROUND_COLOR),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(
                      color: Color(CARD_BACKGROUND_COLOR),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(
                      color: Color(CARD_BACKGROUND_COLOR),
                    ),
                  ),
                  Expanded(
                    child: InputCard(
                      color: Color(CARD_BACKGROUND_COLOR),
                    ),
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
  final Widget cardChild;

  InputCard({@required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: cardChild,
    );
  }
}
