import 'package:easy_list/customWidgets/homeScreenWidget.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/tasks/appRoutingTask.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

  List<Product> products = [];
  AppRouter appRouter = AppRouter();
  HomeScreenWidget homeScreenWidget;

  void addNewProduct(Product product) => setState(() => products.add(product));

  @override
  void initState()
  {
    super.initState();
    homeScreenWidget = HomeScreenWidget(context: context);
  }

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      drawer: homeScreenWidget.getDrawerLayout(onResultCallback: addNewProduct),
      appBar: AppBar(
        title: Text("Easy List"),
      ),
      body: getUIWidget(),
      floatingActionButton: ProductAddButton(addNewProduct),
    );
  }

  Widget getUIWidget(){
    if(products.length == 0)
    {
      return homeScreenWidget.getEmptyListMessageWidget();
    }
    else
    {
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