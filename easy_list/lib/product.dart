import 'package:easy_list/screens/productDetailScreen.dart';
import 'package:flutter/material.dart';

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
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  "Details"
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return ProductDetail();

                  }));
                },
              )

            ],
          ),
        ],
      ),
    );
  }
}