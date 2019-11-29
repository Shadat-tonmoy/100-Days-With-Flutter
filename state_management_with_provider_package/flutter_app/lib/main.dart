import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{

  String data = "My Top Secret Data";
//  String data = "123456";

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      builder: (context) => data,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(data),
          ),
          body: Column(
            children: <Widget>[
              Level1(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                child: TextField(
                  onChanged: (newText){

                  },
                  decoration: InputDecoration(
                    hintText: "Enter Text Here"
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(),
    );
  }
}

class Level3 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        Provider.of<String>(context)
      ),
    );
  }
}



