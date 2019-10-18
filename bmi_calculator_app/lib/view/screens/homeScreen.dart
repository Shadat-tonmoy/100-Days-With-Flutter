import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:bmi_calculator_app/constants/enums.dart';
import 'package:bmi_calculator_app/constants/strings.dart';
import 'package:bmi_calculator_app/view/customWidgets/homeScreenCards.dart';
import 'package:bmi_calculator_app/view/customWidgets/iconWithLabel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color maleCardColor = Color(CARD_BACKGROUND_COLOR);
  Color femaleCardColor = Color(CARD_BACKGROUND_COLOR);

  void updateSelectedGenderColor(GenderType genderType)
  {
    setState(() {
      switch(genderType)
      {
        case GenderType.MALE:
          selectMale();
          break;
        case GenderType.FEMALE:
          selectFemale();
          break;
      }
    });
  }

  void selectFemale()
  {
    femaleCardColor = Color(ACTIVE_CARD_BACKGROUND_COLOR);
    maleCardColor = Color(CARD_BACKGROUND_COLOR);
  }

  void selectMale()
  {
    femaleCardColor = Color(CARD_BACKGROUND_COLOR);
    maleCardColor = Color(ACTIVE_CARD_BACKGROUND_COLOR);

  }

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
                    child: GestureDetector(
                      onTap: (){
                        updateSelectedGenderColor(GenderType.MALE);
                        print("Tapped on male");
                      },
                      child: InputCard(
                        color: maleCardColor,
                        cardChild: IconWithLabel(icon: FontAwesomeIcons.mars, label: MALE,),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        print("Tapped on female");
                        updateSelectedGenderColor(GenderType.FEMALE);
                      },
                      child: InputCard(
                        color: femaleCardColor,
                        cardChild: IconWithLabel(icon: FontAwesomeIcons.venus, label: FEMALE),
                      ),
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


