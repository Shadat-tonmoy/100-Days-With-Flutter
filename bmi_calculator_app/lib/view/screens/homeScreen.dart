import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:bmi_calculator_app/constants/enums.dart';
import 'package:bmi_calculator_app/constants/strings.dart';
import 'package:bmi_calculator_app/constants/styles.dart';
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
  GenderType selectedGender;
  double height = DEFAULT_HEIGHT;

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
    selectedGender = GenderType.FEMALE;
  }

  void selectMale()
  {
    femaleCardColor = Color(CARD_BACKGROUND_COLOR);
    maleCardColor = Color(ACTIVE_CARD_BACKGROUND_COLOR);
    selectedGender = GenderType.MALE;
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
                    child: InputCard(
                      onPressed: (){
                        updateSelectedGenderColor(GenderType.MALE);
                      },
                      color: maleCardColor,
                      cardChild: IconWithLabel(icon: FontAwesomeIcons.mars, label: MALE,),
                    ),
                  ),
                  Expanded(
                    child: InputCard(
                      onPressed: (){
                        updateSelectedGenderColor(GenderType.FEMALE);
                      },
                      color: femaleCardColor,
                      cardChild: IconWithLabel(icon: FontAwesomeIcons.venus, label: FEMALE),
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              HEIGHT,
                              style: iconLabelStyle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: homeNumberStyle,

                              ),
                              SizedBox(
                                width: SPACE_BETWEEN_HEIGHT_UNIT,
                              ),
                              Text(
                                "cm",
                                style: iconLabelStyle,
                              )
                            ],
                          ),
                          Slider(
                            value: height,
                            min: MINIMUM_HEIGHT,
                            max: MAXIMUM_HEIGHT,
                            activeColor: Color(CALCULATE_BUTTON_COLOR),
                            inactiveColor: Color(CARD_TEXT_COLOR),
                            onChanged: (double value)
                            {
                              setState(() {
                                height = value.roundToDouble();
                              });


                            },
                          )
                        ],
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
              margin: EdgeInsets.only(top: 8.0),
              color: Color(CALCULATE_BUTTON_COLOR),
            )
          ],
        ),
      ),
    );
  }
}


