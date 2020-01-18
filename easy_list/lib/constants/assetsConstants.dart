class AssetsConstants
{

  static final String imageBasePath = "assets/images/";
  static final String defaultProductImage = "food.jpg";
  static final String noProductImage = "no_item.png";

}

class AssetPathProvider
{

  static String get noProductImage {
    return AssetsConstants.imageBasePath + AssetsConstants.noProductImage;

}

}