import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget
{

  final Function addNewProduct;
  AddProductScreen({this.addNewProduct});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen>
{
  String productTitle, productDescription, deliveryAddress;
  double productPrice;
  Function addNewProduct;

  @override
  void initState() {
    super.initState();
    addNewProduct = widget.addNewProduct;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Product Title",
                  prefixIcon: Icon(Icons.edit),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                onChanged: (value){
                  productTitle = value;

                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Product Description",
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
                  labelText: "Product Price",
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
                  labelText: "Delivery Address",
                  prefixIcon: Icon(Icons.place),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                onChanged: (value){
                  deliveryAddress = value;
                },

              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          child: Icon(
              Icons.done
          ),
          onPressed: ()
          {
            addNewProduct(getNewProduct());
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Product getNewProduct()
  {
    return Product(
      productTitle: productTitle,
      productDescription: productDescription,
      productPrice: productPrice,
      deliveryAddress: deliveryAddress,
      productImage: AssetsConstants.DEFAULT_PRODUCT_IMAGE
    );
  }
}
