import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  List<FoodItemCard> foodItems = [FoodItemCard()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: HomeScreen(foodItems: foodItems,),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: ()
          {
            print("Adding New Item");
            setState(() {
              foodItems.add(FoodItemCard());
            });
          },
          backgroundColor: Colors.deepOrange,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget
{

  final List<FoodItemCard> foodItems;

  HomeScreen({this.foodItems});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: foodItems,
    );
  }
}


class FoodItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/food.jpg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Food Paradise"),
          )
        ],
      ),
    );
  }
}
