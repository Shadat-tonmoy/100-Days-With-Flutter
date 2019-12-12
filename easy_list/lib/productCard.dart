import 'package:easy_list/models/product.dart';
import 'package:easy_list/screens/productDetailScreen.dart';
import 'package:flutter/material.dart';

import 'package:easy_list/constants/assetsConstants.dart';

class ProductCard extends StatelessWidget
{

  final Product product;

  ProductCard({@required this.product});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(AssetsConstants.IMAGE_BASE_PATH + product.productImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.productTitle),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  "Details"
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return ProductDetail();

                  }));
                },
              )

            ],
          ),
        ],
      ),
    );
  }
}