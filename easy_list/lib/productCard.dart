import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/customWidgets/productDetailScreenWidget.dart';
import 'package:easy_list/models/product.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:easy_list/screens/productDetailScreen.dart';
import 'package:flutter/material.dart';

import 'package:easy_list/constants/assetsConstants.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget
{
  final int productIndex;
  ProductCard({@required this.productIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(
      builder: (context, productData, chile)
      {
        Product product = productData.products.elementAt(productIndex);
        return GestureDetector(
          onTap: (){
            Navigator.push<Product>(context, MaterialPageRoute(builder: (context){
              return ProductDetailScreen(product: product,isManagingProduct: false,);

            })).then((Product result){
              if(result!=null)
              {
                Provider.of<ProductData>(context,listen: false).removeProduct(result);
              }
            });
          },
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset(AssetsConstants.IMAGE_BASE_PATH + product.productImage),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.productTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                ProductPriceTag(
                  productPrice: product.productPrice,
                  priceTagSize: PriceTagSize.SMALL,
                ),
                SizedBox(
                  height: 5.0,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}