import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:bmi_calculator_app/constants/strings.dart';
import 'package:bmi_calculator_app/constants/styles.dart';
import 'package:flutter/material.dart';

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
