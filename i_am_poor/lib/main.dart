import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          "I Am Poor Recoded"
        ),
      ),
      body: Center(
        child: Image(
          image: AssetImage("images/coal.png"),
        ),
      ),
    ),
  ));

}