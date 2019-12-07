import 'package:flutter/material.dart';

import 'foodItem.dart';


class FoodItemList extends StatelessWidget
{

  final List<FoodItemCard> foodItems;

  FoodItemList({this.foodItems});

  @override
  Widget build(BuildContext context) {
    print("Building ListView with ${foodItems.length}");
    return ListView.builder(
      itemBuilder: (context, index) => foodItems[index],
      itemCount: foodItems.length,
    );
  }
}


class FoodAddButton extends StatelessWidget
{


  final Function addNewFoodCallback;

  FoodAddButton(this.addNewFoodCallback);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: ()
      {
        addNewFoodCallback(FoodItemCard());
        print("Adding New Item");

      },
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}