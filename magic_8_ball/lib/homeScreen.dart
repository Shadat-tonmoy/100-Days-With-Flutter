import 'dart:math';
import 'package:flutter/material.dart';

class MagicBallApp extends StatefulWidget {
  @override
  _MagicBallAppState createState() => _MagicBallAppState();
}

class _MagicBallAppState extends State<MagicBallApp>
{

  int imageNumber = 1;

  void updateImageNumber()
  {
    setState(()
    {
      imageNumber = Random().nextInt(5)+1;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
              "Ask Me Anything"
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Center(child: FlatButton(
            child: Image.asset("images/ball$imageNumber.png"),
            onPressed: (){
              updateImageNumber();

            },
          )
          ),
        ),
      ),
    );
  }
}

