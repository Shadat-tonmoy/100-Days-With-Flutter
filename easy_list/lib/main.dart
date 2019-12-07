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
  List<FoodItemCard> foodItems = [];

  void addNewFood(FoodItemCard foodItemCard) => setState(() => foodItems.add(foodItemCard));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: HomeScreen(foodItems: foodItems,),
        floatingActionButton: FoodAddButton(addNewFood),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget
{

  final List<FoodItemCard> foodItems;

  HomeScreen({this.foodItems});

  @override
  Widget build(BuildContext context) => getUIWidget();

  Widget getUIWidget() => foodItems.length == 0 ? Text("No Food Item Found! Please Add One")
      : FoodItemList(
    foodItems: foodItems,
  );
}


