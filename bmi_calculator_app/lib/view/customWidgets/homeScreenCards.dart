import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  InputCard({@required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: cardChild,
    );
  }
}
