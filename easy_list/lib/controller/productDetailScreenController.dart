import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailController
{

  BuildContext context;
  Product product;

  ProductDetailController({this.context, this.product});

  static void showDeleteWarningDialog(BuildContext context, Product product, Function onDeleteCallback)
  {
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        title: Text(
            "Sure To Delete?"
        ),
        content: Text(
            "Once you delete this item it can not be restored!"
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
                "No"
            ),
          ),

          FlatButton(
            onPressed: (){
              Navigator.pop(context);
              if(onDeleteCallback!=null)
                onDeleteCallback(context);
              Provider.of<ProductData>(context,listen: false).removeProduct(product);
            },
            child: Text(
                "Yes"
            ),
          ),

        ],

      );

    });
  }

  Function getDeleteWarningDialogFunction()
  {
    return showDeleteWarningDialog;
  }
}