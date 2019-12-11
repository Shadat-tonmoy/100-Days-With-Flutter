import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/food.jpg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Food Paradise"
                    ),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
