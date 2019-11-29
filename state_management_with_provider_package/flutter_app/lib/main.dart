import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{

  String data = "My Top Secret Data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(data),
        ),
        body: Container(
          child: Level1(data: data),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget
{

  final String data;

  Level1({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(data: data),
    );
  }
}

class Level2 extends StatelessWidget
{
  final String data;

  Level2({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(data: data,),
    );
  }
}

class Level3 extends StatelessWidget
{
  final String data;

  Level3({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data
      ),
    );
  }
}



