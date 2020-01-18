import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/customWidgets/homeScreenWidget.dart';
import 'package:easy_list/providerData/productData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    if (Provider.of<ProductData>(context).products.length == 0) {
      return EmptyListView(emptyViewTitle: Strings.noElementFoundForHomeScreen,);
    } else {
      return ProductList();
    }
  }
}