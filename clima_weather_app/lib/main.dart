import 'package:flutter/material.dart';

void main()
{
  runApp(ClimaApp());
}

class ClimaApp extends StatefulWidget {
  @override
  _ClimaAppState createState() => _ClimaAppState();
}

class _ClimaAppState extends State<ClimaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Clima"
          ),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: (){
                //get location here
              },
              child: Text(
                  "Get Location"
              ),
            ),
          ),
        ),
      ),
    );
  }
}




