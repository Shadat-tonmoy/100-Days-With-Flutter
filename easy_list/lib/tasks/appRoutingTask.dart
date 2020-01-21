import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class AppRouter
{

  Future<Product> toManageProductScreen<Product>(BuildContext context,{Function addNewProduct}) async
  {
    Navigator.pop(context);
    /*Navigator.push(context, MaterialPageRoute(
      builder: (context) => ManageProduct()
    ));*/
    
    Product result = await Navigator.pushNamed(context, RoutingKeys.manageProductScreen);
    return result;
  }

  void toHomeScreen(BuildContext context)
  {
    /*Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomeScreen()
    ));*/
    Navigator.pushNamed(context, RoutingKeys.homeScreen);
  }

  Function getManageProductRouter()
  {
    return toManageProductScreen;
  }

}