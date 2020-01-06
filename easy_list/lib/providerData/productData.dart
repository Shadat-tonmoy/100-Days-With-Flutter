import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier
{

  List<Product> products = [];

  /*ProductData()
  {
    Product product = Product(
        productTitle: "New Product At : ${DateTime.now().toString()}",
        productDescription: "productDescription",
        productPrice: 0.0,
        deliveryAddress: "deliveryAddress",
        productImage: AssetsConstants.DEFAULT_PRODUCT_IMAGE
    );
    products.add(product);
  }*/

  void addProduct(Product product)
  {
    products.add(product);
    notifyListeners();
  }


}