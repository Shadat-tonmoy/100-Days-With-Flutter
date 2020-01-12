import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/customWidgets/productDetailScreenWidget.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductItem extends StatelessWidget {

  final Product product;

  SingleProductItem({this.product});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical:4.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(AssetsConstants.IMAGE_BASE_PATH + product.productImage),
                width: MediaQuery.of(context).size.width * 0.22,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.productTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      product.productDescription,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey[600]
                      ),
                    ),
                    ProductPriceTag(
                      productPrice: product.productPrice,
                      priceTagSize: PriceTagSize.EXTRA_SMALL,
                    ),
                  ],
                ),
              )

            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Divider(
            color: Colors.grey[500],

          )
        ],
      ),
    );
  }
}

class AllProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(
      builder: (context,productData,child) => Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (context, index) => SingleProductItem(
          product: productData.products[index],
        ),
          itemCount: productData.totalProduct,
        ),
      ),
    );
  }
}

