import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
                backgroundColor: Colors.blueGrey[900],
                title: Text(
                    "I Am Rich"
                ),
            ),
            body: Center(
                child: Text("Hello World"),
            ),
        )
    ));
}