import 'package:easy_list/providerData/productData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(
      builder: (context, productData, child){
        return Center(
          child: Text(
              "List of all product here Now Total is ${productData.products.length}"
          ),
        );
      },
    );
  }
}
