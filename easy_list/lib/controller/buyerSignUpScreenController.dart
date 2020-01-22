import 'package:easy_list/views/buyerSignUpScreenView.dart';
import 'package:flutter/material.dart';

class BuyerSignUpScreenController implements BuyerSignUpScreenListener
{
  BuyerSignUpScreenView screenView;
  BuyerSignUpScreenViewState viewState;
  final BuildContext context;

  BuyerSignUpScreenController({this.context});

  void bindView(BuyerSignUpScreenView screenView)
  {
    this.screenView = screenView;
    this.viewState = screenView.getViewState();
    screenView.registerListener(this);
  }




}