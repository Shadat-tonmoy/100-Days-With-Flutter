import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {

  final IconData icon;
  final String label;

  IconWithLabel({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: INPUT_CARD_ICON_SIZE,
        ),
        SizedBox(
          height: DEFAULT_SPACE,
        ),
        Text(
          label,
          style: TextStyle(
              color: Color(CARD_TEXT_COLOR)
          ),
        )
      ],
    );
  }
}