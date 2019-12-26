class Product
{

  String productDescription, deliveryAddress,productImage,productTitle;
  double productPrice;

  Product({this.productTitle, this.productImage, this.productDescription, this.deliveryAddress, this.productPrice});

  @override
  String toString() {
    return 'Product{productDescription: $productDescription, deliveryAddress: $deliveryAddress, productImage: $productImage, productTitle: $productTitle, productPrice: $productPrice}';
  }


}