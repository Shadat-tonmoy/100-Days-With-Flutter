import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/screens/authScreen.dart';
import 'package:easy_list/screens/homeScreen.dart';
import 'package:easy_list/screens/manageProductScreen.dart';
import 'package:flutter/material.dart';

import 'package:easy_list/constants/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{

  final ProductData productData = ProductData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductData>(
      create: (context) => productData,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.purple,
        ),
//      home: AuthScreen(),
        routes: {
          RoutingKeys.AUTH_SCREEN : (context) => AuthScreen(),
          RoutingKeys.HOME_SCREEN : (context) => HomeScreen(),
          RoutingKeys.MANAGE_PRODUCT_SCREEN : (context) => ManageProduct(context: context,),

        },
      ),
    );
  }
}


