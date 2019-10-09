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


class DicePage extends StatefulWidget
{
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage>
{
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                child: Image.asset("images/dice$leftDiceNumber.png"),
                onPressed: () {
                  setState(() {
                    leftDiceNumber = 6;
                  });
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Image.asset("images/dice$rightDiceNumber.png"),
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