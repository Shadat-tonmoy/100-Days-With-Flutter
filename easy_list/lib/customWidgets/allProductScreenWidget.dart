import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/controller/allProductScreenController.dart';
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
    return GestureDetector(
      onTap: (){
        showProductOptionsBottomSheet(context);
      },
      child: Container(
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
                ProductDetailsText(product: product)

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
      ),
    );
  }

  void showProductOptionsBottomSheet(BuildContext context)
  {
    showModalBottomSheet(
        context: context,
        builder: (context)
        {
          return ProductOptionBottomSheetLayout(
            product: product,
          );
        });
  }
}

class ProductOptionBottomSheetLayout extends StatelessWidget
{

  final Product product;

  ProductOptionBottomSheetLayout({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
          children: <Widget>[
            BottomSheetSingleItem(
              title: Strings.viewProductDetails,
              icon: Icons.remove_red_eye,
              onTapCallback: () => print("View For ${product.productPrice}"),
            ),
            BottomSheetSingleItem(
              title: Strings.editProductInfo,
              icon: Icons.edit,
              onTapCallback: () => print("Edit For ${product.productPrice}")
              ,
            ),
            BottomSheetSingleItem(
              title: Strings.deleteProduct,
              icon: Icons.delete,
              onTapCallback: () => print("Delete For ${product.productPrice}"),
            )
          ],
      ),
    );
  }
}

class ProductDetailsText extends StatelessWidget {
  const ProductDetailsText({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
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

class BottomSheetSingleItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTapCallback;
  BottomSheetSingleItem({this.title, this.icon, this.onTapCallback});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0
              ),
            )
          ],
        ),
      ),
    );
  }
}


