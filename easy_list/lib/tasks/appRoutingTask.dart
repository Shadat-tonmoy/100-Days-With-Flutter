import 'package:easy_list/screens/homeScreen.dart';
import 'package:easy_list/screens/manageProductScreen.dart';
import 'package:flutter/material.dart';

class AppRouter
{

  void toManageProductScreen(BuildContext context)
  {
    print("Navigating....");
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ManageProduct()
    ));
  }

  void toHomeScreen(BuildContext context)
  {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomeScreen()
    ));
  }

  Function getManageProductRouter()
  {
    return toManageProductScreen;
  }

}