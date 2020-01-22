import 'package:easy_list/controller/buyerSignUpScreenController.dart';
import 'package:easy_list/views/buyerSignUpScreenView.dart';
import 'package:flutter/material.dart';

class BuyerSignUpScreen extends StatelessWidget
{

 /* final BuildContext context;

  BuyerSignUpScreen({this.context});*/

  @override
  Widget build(BuildContext context) {
    BuyerSignUpScreenView screenView = BuyerSignUpScreenView();
    BuyerSignUpScreenController controller = BuyerSignUpScreenController();
    controller.bindView(screenView);
    screenView.registerListener(controller);
    return screenView;
  }
}
