class Product
{

  String _productTitle;
  String _productImage;

  Product(this._productTitle, this._productImage);

  String get productImage => _productImage;

  set productImage(String value) {
    _productImage = value;
  }

  String get productTitle => _productTitle;

  set productTitle(String value) {
    _productTitle = value;
  }


}