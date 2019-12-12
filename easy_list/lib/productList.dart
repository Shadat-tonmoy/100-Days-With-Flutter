import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

import 'productCard.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({this.products});

  @override
  Widget build(BuildContext context) {
    print("Building ListView with ${products.length}");
    return ListView.builder(
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
      ),
      itemCount: products.length,
    );
  }
}

class ProductAddButton extends StatelessWidget {
  final Function addNewProductCallback;

  ProductAddButton(this.addNewProductCallback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        addNewProductCallback(Product("new_product","food.jpg"));
        print("Adding New Item");
      },
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
