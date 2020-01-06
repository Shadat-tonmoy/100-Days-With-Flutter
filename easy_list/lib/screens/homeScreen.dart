import 'package:easy_list/customWidgets/homeScreenWidget.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/views/homeScreenView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{

  final ProductData productData = ProductData();

  @override
  Widget build(BuildContext context)
  {
    return  ChangeNotifierProvider<ProductData>(
      create: (context) => productData,
      child: Scaffold(
        drawer: HomeScreenDrawerLayout(),
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: HomeScreenView(),
        floatingActionButton: ProductAddButton(),
      ),
    );
  }
}