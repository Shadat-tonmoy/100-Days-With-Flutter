import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget
{
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen>
{
  String productTitle, productDescription, deliveryAddress;
  double productPrice;

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Product Title",
                prefixIcon: Icon(Icons.edit),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onChanged: (value){
                productTitle = value;

              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Product Description",
                prefixIcon: Icon(Icons.edit),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onChanged: (value){
                productDescription = value;

              },
              maxLines: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Product Price",
                prefixIcon: Icon(Icons.edit),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onChanged: (value){
                productPrice = double.parse(value);
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Delivery Address",
                prefixIcon: Icon(Icons.place),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onChanged: (value){
                deliveryAddress = value;
              },

            )
          ],
        ),
      ),
    );
  }
}
