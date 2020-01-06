import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/tasks/appRoutingTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../productCard.dart';

class HomeScreenWidget extends StatelessWidget
{


  @override
  Widget build(BuildContext context)
  {

    if(Provider.of<ProductData>(context).products.length == 0)
    {
      return getEmptyListMessageWidget();
    }
    else
    {
      return ProductList(
//        products: products,
//        productDeleteCallback: onProductDelete,
      );

    }
  }





//  HomeScreenWidget({@required this.context});

  /*Widget _getNavDrawerItem({Widget navDrawerItemView, Function onItemClickCallback, Function onItemClickResultCallback})
  {
    return GestureDetector(
      onTap: () async {
        dynamic result = await onItemClickCallback(context);
        if(result!=null){
          print("Added Product From Router Callback ${result.toString()}");
          onItemClickResultCallback(result);
        }
      },
      child: navDrawerItemView,
    );

  }*/

  Widget _getNavDrawerItemView(String title, IconData icon)
  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey[600],
          ),
          SizedBox(
            width: 24.0,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16.0,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }

  Widget getEmptyListMessageWidget()
  {
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

  Widget getDrawerLayout({Function newProductAddCallback})
  {
    AppRouter appRouter = AppRouter();
    return Container(
      width: 260.0,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView
      (
        child: Column(
          children: <Widget>[
            Image.asset(AssetsConstants.IMAGE_BASE_PATH+"food.jpg"),
            /*_getNavDrawerItem(
              navDrawerItemView: _getNavDrawerItemView("Manage Product", Icons.edit),
              onItemClickCallback: appRouter.getManageProductRouter(),
              onItemClickResultCallback: newProductAddCallback
            ),
            _getNavDrawerItem(
              navDrawerItemView: _getNavDrawerItemView("Manage Account", Icons.account_box),
            )*/
          ],
        ),
      ),
    );
  }

  Widget getAddProductButton()
  {
    return ProductAddButton();
  }

 /* Widget getUIWidget(){
    print("Context in homescreenwidet $context");
    if(Provider.of<ProductData>(context).products.length == 0)
    {
      return getEmptyListMessageWidget();
    }
    else
    {
      return ProductList(
//        products: products,
//        productDeleteCallback: onProductDelete,
      );

    }
  }*/
}


class ProductList extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    print("Building ListView with ${Provider.of<ProductData>(context).products.length}");
    return ListView.builder(
      itemBuilder: (context, index) => ProductCard(
        product: Provider.of<ProductData>(context).products[index],
//        productDeleteCallback: widget.productDeleteCallback,
      ),
      itemCount: Provider.of<ProductData>(context).products.length,
    );
  }
}

class ProductAddButton extends StatelessWidget {

//  final Function addNewProductCallback;
//  ProductAddButton(this.addNewProductCallback);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: ()
      {
        Product product = Product(
            productTitle: "New Product At : ${DateTime.now().toString()}",
            productDescription: "productDescription",
            productPrice: 0.0,
            deliveryAddress: "deliveryAddress",
            productImage: AssetsConstants.DEFAULT_PRODUCT_IMAGE
        );
        Provider.of<ProductData>(context,listen: false).addProduct(product);
//        addNewProductCallback(product);
      },
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}


