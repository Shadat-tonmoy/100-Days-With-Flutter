import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductItem extends StatelessWidget {

  final Product product;

  SingleProductItem({this.product});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Text(
        product.productTitle,
      ),
    );
  }
}

class AllProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(
      builder: (context,productData,child) => Container(
        child: ListView.builder(itemBuilder: (context, index) => SingleProductItem(
          product: productData.products[index],
        ),
          itemCount: productData.totalProduct,
        ),
      ),
    );
  }
}

