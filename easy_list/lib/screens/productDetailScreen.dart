import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

import 'package:easy_list/constants/assetsConstants.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productTitle),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset(
                      AssetsConstants.IMAGE_BASE_PATH + product.productImage),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.productTitle),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: 16.0
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
    );
  }
}
