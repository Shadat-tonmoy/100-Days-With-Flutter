import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/tasks/appRoutingTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../productCard.dart';

class EmptyListView extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
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
                    fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ProductCard(
        productIndex: index,
      ),
      itemCount: Provider.of<ProductData>(context).products.length,
    );
  }
}

class ProductAddButton extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        Product product = Product(
            productTitle: "New Product At : ${DateTime.now().toString()}",
            productDescription: "productDescription",
            productPrice: 0.0,
            deliveryAddress: "deliveryAddress",
            productImage: AssetsConstants.DEFAULT_PRODUCT_IMAGE);
        Provider.of<ProductData>(context, listen: false).addProduct(product);
//        addNewProductCallback(product);
      },
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}

class HomeScreenDrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.0,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(AssetsConstants.IMAGE_BASE_PATH + "food.jpg"),
            _getNavDrawerItem(
              navDrawerItemView:
                  NavDrawerItemView(title: "Manage Product", icon: Icons.edit),
            ),
            _getNavDrawerItem(
              navDrawerItemView: NavDrawerItemView(
                  title: "Manage Account", icon: Icons.account_box),
            )
          ],
        ),
      ),
    );
  }

  Widget _getNavDrawerItem({Widget navDrawerItemView}) {
    return GestureDetector(
      onTap: () /*async */ {
        /*dynamic result = await onItemClickCallback(context);
        if(result!=null){
          print("Added Product From Router Callback ${result.toString()}");
          onItemClickResultCallback(result);
        }*/
      },
      child: navDrawerItemView,
    );
  }
}

class NavDrawerItemView extends StatelessWidget {
  final String title;
  final IconData icon;
  NavDrawerItemView({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
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
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
