import 'package:flutter/material.dart';

import 'foodItem.dart';


class FoodItemList extends StatelessWidget
{

  final List<FoodItemCard> foodItems;

  FoodItemList({this.foodItems});

  @override
  Widget build(BuildContext context) {
    print("Building ListView with ${foodItems.length}");
    return SingleChildScrollView(
      child: Column(
        children: foodItems,
      ),
    );
  }
}