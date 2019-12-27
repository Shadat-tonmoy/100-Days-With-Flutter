import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreenWidget
{

  BuildContext context;
  Product product;

  ProductDetailScreenWidget({this.context, this.product});


  Widget getAppBar()
  {
    return AppBar(
      title: Text(product.productTitle),
    );
  }

  Widget getProductDetailCard({Function warningDialogFunction})
  {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
              AssetsConstants.IMAGE_BASE_PATH + product.productImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.productTitle,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600]
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            child: Text(
              "\$ ${product.productPrice} Only",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white
              ),

            ),
          ),
          getProductInfoText(
            infoLabel: "Description",
            info: product.productDescription,
            icon: Icons.info
          ),
          getProductInfoText(
            infoLabel: "Delivery Address",
            info: product.deliveryAddress,
            icon: Icons.place
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
                onPressed: ()
                {
                  warningDialogFunction();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getProductInfoText({String infoLabel, String info, IconData icon})
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                icon
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                infoLabel,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600]

                ),
              ),
            ],
          ),
          Divider(),
          Text(
              info
          ),
        ],
      ),
    );
  }
}