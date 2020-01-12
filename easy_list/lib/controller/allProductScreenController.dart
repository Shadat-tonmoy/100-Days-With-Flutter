import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class AllProductScreenController
{

  final BuildContext context;
  final Product product;

  AllProductScreenController({this.context,this.product});

  void showProductOptionsBottomSheet()
  {
    showModalBottomSheet(
        context: context,
        builder: (context)
        {
          return Container(
            child: Text(
                product.toString()
            ),
          );
        });
  }



}