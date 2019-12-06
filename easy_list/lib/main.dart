import 'dart:ui';

import 'package:easy_list/foodItemList.dart';
import 'package:flutter/material.dart';

import 'foodItem.dart';

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
  Widget build(BuildContext context)
  {
    return FoodItemList(
      foodItems: foodItems,
    );
  }
}


