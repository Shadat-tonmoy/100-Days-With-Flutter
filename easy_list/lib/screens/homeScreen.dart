import 'package:flutter/material.dart';

import '../foodItem.dart';
import '../foodItemList.dart';

class HomeScreen extends StatefulWidget
{

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

  List<FoodItemCard> foodItems = [];

  void addNewFood(FoodItemCard foodItemCard) => setState(() => foodItems.add(foodItemCard));


  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Easy List"),
      ),
      body: getUIWidget(),
      floatingActionButton: FoodAddButton(addNewFood),
    );
  }

  Widget getUIWidget(){
    if(foodItems.length == 0){
      return Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/no_item.png"),
                fit: BoxFit.fill,
                width: 250,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No Element Found!\nPlease tap the '+' button to add element",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]
                  ),

                ),
              )
            ],
          ),
        ),
      );
    }
    else {
      return FoodItemList(
        foodItems: foodItems,
      );

    }
  }
}