import 'dart:math';

import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
class DummyDataProvider
{
  static Product getDummyProduct()
  {
    return Product(
        productTitle: "This is a new awsome dummy product provided by dummyDataProvider class at : ${getCurrentTimeString()}",
        productDescription: "This is a long product description that will be nicely visible in screen. This is a long product description that will be nicely visible in screen. This is a long product description that will be nicely visible in screen. This is a long product description that will be nicely visible in screen. This is a long product description that will be nicely visible in screen. This is a long product description that will be nicely visible in screen.",
        productPrice: (Random().nextDouble()*100).roundToDouble(),
        deliveryAddress: "This is the delivery address of product. This is the delivery address of product. This is the delivery address of product. This is the delivery address of product. This is the delivery address of product.",
        productImage: AssetsConstants.DEFAULT_PRODUCT_IMAGE);

  }

  static String getCurrentTimeString()
  {

    DateTime dateTime = DateTime.now();
    String dateTimeString = "${dateTime.day}/${dateTime.month}/${dateTime.year} | ${dateTime.hour}:${dateTime.minute}";
    return dateTimeString;

  }

}