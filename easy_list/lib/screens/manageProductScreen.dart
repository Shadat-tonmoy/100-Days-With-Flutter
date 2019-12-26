import 'package:easy_list/models/product.dart';
import 'package:easy_list/screens/addProductScreen.dart';
import 'package:easy_list/screens/allProductScreen.dart';
import 'package:flutter/material.dart';

class ManageProduct extends StatelessWidget {

  final BuildContext context;

  ManageProduct({this.context});

  void addNewProduct(Product product)
  {
    Navigator.pop(context,product);
  }

  @override
  Widget build(BuildContext context)
  {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Manage Product"
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text:"Add Product",
                icon: Icon(Icons.edit)
              ),
              Tab(
                text: "All Products",
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AddProductScreen(addNewProduct: addNewProduct,),
            AllProductScreen()

          ],
        ),

      ),
    );
  }
}
