import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    var diceNumber = 1;
    return SafeArea(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                  child: Image.asset("images/dice$diceNumber.png"),
                onPressed: () {
                  print("Clicked On First Image");
                },
              ),
              ),
            Expanded(
              child: FlatButton(
                child: Image.asset("images/dice$diceNumber.png"),
                onPressed: () {
                  print("Clicked On Second Image");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}