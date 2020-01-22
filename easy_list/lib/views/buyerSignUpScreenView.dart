import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyerSignUpScreenView extends StatefulWidget
{
  BuyerSignUpScreenViewState viewState;
  BuyerSignUpScreenListener listener;


  @override
  BuyerSignUpScreenViewState createState()
  {
    viewState = BuyerSignUpScreenViewState();
    return viewState;
  }

  void registerListener(BuyerSignUpScreenListener listener)
  {
    this.listener = listener;
  }

  BuyerSignUpScreenViewState getViewState()
  {
    return viewState;
  }
}

class BuyerSignUpScreenViewState extends State<BuyerSignUpScreenView> {
  @override
  Widget build(BuildContext context) {
    print("BuyerSignUpScreenBuilding...");
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "BuyerSignUp"
        ),
      ),

    );
  }
}

abstract class BuyerSignUpScreenListener
{


}
