import 'package:flutter/material.dart';

class AppMaterialButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function onPressedCallback;

  AppMaterialButton({this.color,this.text,this.onPressedCallback});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressedCallback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
              text
          ),
        ),
      ),
    );
  }
}