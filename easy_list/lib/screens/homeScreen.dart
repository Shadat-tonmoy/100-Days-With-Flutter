import 'package:easy_list/customWidgets/homeScreenWidget.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/tasks/appRoutingTask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{

  ProductData productData = ProductData();
  List<Product> products = [];
  AppRouter appRouter = AppRouter();
  HomeScreenWidget homeScreenWidget;

//  void addNewProduct(Product product) => setState(() => products.add(product));

  /*@override
  void initState()
  {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context)
  {
//    print("Context in homescreen $context");
    return  ChangeNotifierProvider<ProductData>(
      create: (context) => productData,
      child: Scaffold(
//        drawer: homeScreenWidget.getDrawerLayout(),
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: HomeScreenWidget(),
        floatingActionButton: ProductAddButton(),
      ),
    );
  }

  /*Widget getUIWidget(){
    return homeScreenWidget.getUIWidget()
  }*/

  /*void onProductDelete(Product product)
  {
    if(product!=null)
      setState(() => products.remove(product));

  }*/
}