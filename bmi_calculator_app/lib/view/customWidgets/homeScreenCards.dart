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
