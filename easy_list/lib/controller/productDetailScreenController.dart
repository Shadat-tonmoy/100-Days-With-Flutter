import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailController
{

  BuildContext context;
  Product product;

  ProductDetailController({this.context, this.product});

  void showDeleteWarningDialog()
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
              Navigator.pop(context,product);
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