import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/screens/authScreen.dart';
import 'package:easy_list/screens/homeScreen.dart';
import 'package:easy_list/screens/manageProductScreen.dart';
import 'package:easy_list/screens/sellerSignUpScreen.dart';
import 'package:easy_list/screens/buyerSignUpScreen.dart';
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
          RoutingKeys.authScreen : (context) => AuthScreen(),
          RoutingKeys.homeScreen : (context) => HomeScreen(),
          RoutingKeys.manageProductScreen : (context) => ManageProduct(context: context,),
          RoutingKeys.buyerSignUpScreen : (context) => BuyerSignUpScreen(),
          RoutingKeys.sellerSignUpScreen: (context) => SellerSignUpScreen(context: context,),

        },
      ),
    );
  }
}


