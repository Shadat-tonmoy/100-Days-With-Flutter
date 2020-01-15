import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/models/product.dart';
import 'package:flutter/material.dart';

class ProductInfoFieldScreen extends StatefulWidget
{

  final Function addNewProduct;
  final Product product;
  ProductInfoFieldScreen({this.addNewProduct, this.product});

  @override
  _ProductInfoFieldScreenState createState() => _ProductInfoFieldScreenState();
}

class _ProductInfoFieldScreenState extends State<ProductInfoFieldScreen>
{
  String productTitle, productDescription, deliveryAddress;
  double productPrice;
  Function addNewProduct;
  Product productToUpdate;
  bool forUpdatingProduct;

  @override
  void initState() {
    super.initState();
    addNewProduct = widget.addNewProduct;
    productToUpdate = widget.product;
    forUpdatingProduct = productToUpdate != null;

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: forUpdatingProduct ? AppBar(
        title: Text(
            Strings.editProductInfo
        ),
      ):null,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Product Title",
                  prefixIcon: Icon(Icons.edit),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                onChanged: (value){
                  forUpdatingProduct ? productToUpdate.setProductTitle(value) : productTitle = value;
                },
                controller: TextEditingController(
                  text: forUpdatingProduct ? productToUpdate.productTitle : Strings.emptyText
                ),


              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Product Description",
                  prefixIcon: Icon(Icons.edit),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                onChanged: (value){
                  forUpdatingProduct ? productToUpdate.setProductDescription(value) : productDescription = value;

                },
                maxLines: 5,
                controller: TextEditingController(
                  text: forUpdatingProduct ? productToUpdate.productDescription : Strings.emptyText
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Product Price",
                  prefixIcon: Icon(Icons.edit),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                onChanged: (value){
                  forUpdatingProduct ? productToUpdate.setProductPrice(double.parse(value))
                      : productPrice = double.parse(value);
                },
                keyboardType: TextInputType.number,
                controller: TextEditingController(
                  text: forUpdatingProduct ? productToUpdate.productPrice.toString() : Strings.emptyText
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Delivery Address",
                  prefixIcon: Icon(Icons.place),
                  contentPadding: EdgeInsets.all(16.0),
                ),
                onChanged: (value){
                  forUpdatingProduct ? productToUpdate.setProductTitle(value) : deliveryAddress = value;
                },
                controller: TextEditingController(
                    text: forUpdatingProduct ? productToUpdate.deliveryAddress : Strings.emptyText
                )

              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          child: Icon(
              Icons.done
          ),
          onPressed: ()
          {
            forUpdatingProduct ? Navigator.pop(context,getUpdatedProduct()) : addNewProduct(getNewProduct());
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Product getNewProduct()
  {
    return Product(
      productTitle: productTitle,
      productDescription: productDescription,
      productPrice: productPrice,
      deliveryAddress: deliveryAddress,
      productImage: AssetsConstants.DEFAULT_PRODUCT_IMAGE
    );
  }

  Product getUpdatedProduct()
  {
    return productToUpdate;
  }
}
