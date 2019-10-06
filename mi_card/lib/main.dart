import 'package:flutter/material.dart';

void main()
{
  runApp(miCardApp());
}

class miCardApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Text("Hello World"),
            margin: EdgeInsets.all(32),
            width: 64,
            height: 64,
            padding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }

}