class Product
{

  String productDescription, deliveryAddress,productImage,productTitle;
  double productPrice;

  Product({this.productTitle, this.productImage, this.productDescription, this.deliveryAddress, this.productPrice});

  @override
  String toString() {
    return 'Product{productDescription: $productDescription, deliveryAddress: $deliveryAddress, productImage: $productImage, productTitle: $productTitle, productPrice: $productPrice}';
  }

  void setProductTitle(String productTitle){
    this.productTitle = productTitle;
  }

  void setProductImage(String productImage){
    this.productImage = productImage;
  }

  void setDeliveryAddress(String deliveryAddress){
    this.deliveryAddress = deliveryAddress;
  }

  void setProductDescription(String productDescription){
    this.productDescription= productDescription;
  }

  void setProductPrice(double productPrice){
    this.productPrice = productPrice;
  }


}