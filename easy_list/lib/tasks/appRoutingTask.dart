import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/screens/homeScreen.dart';
import 'package:easy_list/screens/manageProductScreen.dart';
import 'package:flutter/material.dart';

class AppRouter
{

  void toManageProductScreen(BuildContext context)
  {
    Navigator.pop(context);
    /*Navigator.push(context, MaterialPageRoute(
      builder: (context) => ManageProduct()
    ));*/
    Navigator.pushNamed(context, RoutingKeys.MANAGE_PRODUCT_SCREEN);
  }

  void toHomeScreen(BuildContext context)
  {
    /*Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomeScreen()
    ));*/
    Navigator.pushNamed(context, RoutingKeys.HOME_SCREEN);
  }

  Function getManageProductRouter()
  {
    return toManageProductScreen;
  }

}