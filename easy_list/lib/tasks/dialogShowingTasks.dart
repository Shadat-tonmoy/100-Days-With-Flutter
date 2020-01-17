import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogShowingTasks
{

  BuildContext context;
  Product product;

  DialogShowingTasks({this.context, this.product});

  static void showDeleteWarningDialog(BuildContext context, Product product, Function onDeleteCallback)
  {
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        title: Text(
            Strings.sureToDelete
        ),
        content: Text(
            Strings.deleteWarning
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
                Strings.no
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
                Strings.yes
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