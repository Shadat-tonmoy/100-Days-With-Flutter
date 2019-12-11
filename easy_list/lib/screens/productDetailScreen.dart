import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Product Detail Goes Here"
          ),
        ),
      ),
    );
  }
}
