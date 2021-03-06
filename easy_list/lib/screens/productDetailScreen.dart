import 'package:easy_list/tasks/dialogShowingTasks.dart';
import 'package:easy_list/customWidgets/productDetailScreenWidget.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

import 'package:easy_list/constants/assetsConstants.dart';

class ProductDetailScreen extends StatelessWidget
{

  final Product product;
  final bool isManagingProduct;
  ProductDetailScreenWidget productDetailScreenWidget;
  DialogShowingTasks productDetailController;


  ProductDetailScreen({@required this.product,this.isManagingProduct});

  void initProductDetailWidget(BuildContext context)
  {
    productDetailScreenWidget = ProductDetailScreenWidget(
        context: context,
        product: product,
        isManagingProduct: isManagingProduct
    );

    productDetailController = DialogShowingTasks(
      context: context,
      product: product
    );
  }

  @override
  Widget build(BuildContext context) {
    initProductDetailWidget(context);
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: productDetailScreenWidget.getAppBar(),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                productDetailScreenWidget.getProductDetailCard()
              ]),
        ),
      ),
    );
  }
}
