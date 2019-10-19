import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:bmi_calculator_app/constants/enums.dart';
import 'package:bmi_calculator_app/constants/strings.dart';
import 'package:bmi_calculator_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPressed;

  InputCard({@required this.color, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: cardChild,
      ),
    );
  }
}

class HomeScreenSlider extends StatelessWidget {

  final double height;
  final Function onChangedValue;

  HomeScreenSlider({@required this.height, this.onChangedValue});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
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
//              height.toString(),
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
        SliderTheme(
          data: SliderThemeData(
              thumbColor: Color(CALCULATE_BUTTON_COLOR),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(CARD_TEXT_COLOR),
              overlayColor:
              Color(CALCULATE_BUTTON_COLOR_TRANS)),
          child: Slider(
            value: height,
            min: MINIMUM_HEIGHT,
            max: MAXIMUM_HEIGHT,
            onChanged: onChangedValue,
          ),
        )
      ],
    );
  }

}

class RoundButton extends StatelessWidget {
  final ButtonType buttonType;
  final Function onPressed;

  RoundButton({this.buttonType, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(ROUND_BUTTON_BACKGROUND_COLOR),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: onPressed,
      elevation: 6.0,
      child: Icon(
          buttonType == ButtonType.PLUS ? FontAwesomeIcons.plus : FontAwesomeIcons.minus
      ),
    );
  }
}

class InputWithPlusMinus extends StatelessWidget{

  final double value;
  final Function incrementValue, decrementValue;
  final String label;

  InputWithPlusMinus({this.label, this.value, this.incrementValue, this.decrementValue});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: iconLabelStyle,
        ),
        Text(
          value.toString(),
          style: homeNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundButton(
              buttonType: ButtonType.PLUS,
              onPressed: incrementValue
            ),
            SizedBox(
              width: DEFAULT_SPACE,
            ),
            RoundButton(
              buttonType: ButtonType.MINUS,
              onPressed: decrementValue,
            )
          ],
        )
      ],
    );
  }

}