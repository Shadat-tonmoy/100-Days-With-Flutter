import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/customWidgets/homeScreenWidget.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/tasks/appRoutingTask.dart';
import 'package:flutter/material.dart';

import '../productCard.dart';
import '../productList.dart';

class HomeScreen extends StatefulWidget
{

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

  List<Product> products = [];
  AppRouter appRouter = AppRouter();

  void addNewProduct(Product product) => setState(() => products.add(product));


  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(AssetsConstants.IMAGE_BASE_PATH+"food.jpg"),
              HomeScreenWidget.getNavDrawerItem("Manage Product", Icons.edit,appRouter.getManageProductRouter(),context),
              HomeScreenWidget.getNavDrawerItem("Manage Account", Icons.account_circle, appRouter.getManageProductRouter(),context),
            ],
          ),
        )
      ),
      appBar: AppBar(
        title: Text("Easy List"),
      ),
      body: getUIWidget(),
      floatingActionButton: ProductAddButton(addNewProduct),
    );
  }

  Widget getUIWidget(){
    if(products.length == 0){
      return Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/no_item.png"),
                fit: BoxFit.fill,
                width: 250,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No Element Found!\nPlease tap the '+' button to add element",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]
                  ),

                ),
              )
            ],
          ),
        ),
      );
    }
    else {
      return ProductList(
        products: products,
        productDeleteCallback: onProductDelete,
      );

    }
  }

  void onProductDelete(Product product)
  {
    if(product!=null)
      setState(() => products.remove(product));

  }
}