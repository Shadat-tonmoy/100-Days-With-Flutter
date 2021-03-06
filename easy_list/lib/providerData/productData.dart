import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier
{

  List<Product> products = [];



  void addProduct(Product product)
  {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product)
  {
    products.remove(product);
    notifyListeners();
  }

  void updateProduct(int index, Product product)
  {
    products[index] = product;
    notifyListeners();
  }

  int get totalProduct {
    return products.length;
  }

  bool get hasProduct {
    return totalProduct > 0;

  }


}