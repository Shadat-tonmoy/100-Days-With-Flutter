import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: HomeScreen(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: (){
            print("Will Add New Card");
          },
          backgroundColor: Colors.deepOrange,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset("assets/images/food.jpg"),
        SizedBox(
          height: 20,
        ),
        Text(
          "Food Paradise"
        )
      ],
    ));
  }
}
