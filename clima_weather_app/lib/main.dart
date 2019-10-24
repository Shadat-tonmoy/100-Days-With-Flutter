import 'package:flutter/material.dart';

void main()
{
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
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
      ),
    );
  }
}



