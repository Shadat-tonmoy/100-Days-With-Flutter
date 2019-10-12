import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: FlatButton(
              child: Text("Play Sound"),
              onPressed: ()
              {
                print("Will Play Sound");
                
              },
            ),
          ),
        ),
      ),
    );
  }
}
