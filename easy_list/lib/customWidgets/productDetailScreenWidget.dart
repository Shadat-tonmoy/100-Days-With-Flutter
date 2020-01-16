import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/controller/productDetailScreenController.dart';
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

  Widget getProductDetailCard()
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
          ProductPriceTag(
            productPrice : product.productPrice,
            priceTagSize: PriceTagSize.NORMAL,),
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
                  ProductDetailController.showDeleteWarningDialog(context, product, onProductDelete);
//                  warningDialogFunction();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  void onProductDelete(BuildContext context)
  {
    Navigator.pop(context);
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

class ProductPriceTag extends StatelessWidget {

  ProductPriceTag({ @required this.productPrice, @required this.priceTagSize});

  final double productPrice;
  final PriceTagSize priceTagSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(),
      margin: getMargin(),
      decoration: BoxDecoration(
          color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Text(
        "\$ ${productPrice.toString()} Only",
        style: TextStyle(
          fontSize: getFontSize(),
          color: Colors.white
        ),

      ),
    );
  }

  double getFontSize()
  {
    switch (priceTagSize)
    {
      case PriceTagSize.NORMAL:
        return 16.0;
      case PriceTagSize.SMALL:
        return 12.0;
      case PriceTagSize.EXTRA_SMALL:
        return 10.0;
      default :
        return 12.0;
    }
  }

  EdgeInsets getPadding()
  {
    switch (priceTagSize)
    {
      case PriceTagSize.NORMAL:
        return EdgeInsets.all( 8.0);
      case PriceTagSize.SMALL:
        return EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0);
      case PriceTagSize.EXTRA_SMALL:
        return EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0);
      default :
        return EdgeInsets.all(8.0);
    }
  }

  EdgeInsets getMargin()
  {
    switch (priceTagSize)
    {
      case PriceTagSize.NORMAL:
        return EdgeInsets.symmetric(vertical: 8.0);
      case PriceTagSize.SMALL:
        return EdgeInsets.symmetric(vertical: 8.0);
      case PriceTagSize.EXTRA_SMALL:
        return EdgeInsets.symmetric(vertical: 2.0);
      default :
        return EdgeInsets.symmetric(vertical: 8.0);
    }
  }
}