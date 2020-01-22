import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/screens/buyerSignUpScreen.dart';
import 'package:easy_list/views/authScreenView.dart';
import 'package:flutter/material.dart';

class AuthScreenController implements AuthScreenListener
{

  final BuildContext context;
  AuthScreenView authScreenView;
  AuthScreenViewState viewState;

  AuthScreenController({@required this.context});

  void _moveToHomeScreen()
  {
    Navigator.pushReplacementNamed(
        context, RoutingKeys.homeScreen);
  }

  @override
  void onLoginButtonPressed()
  {
    _moveToHomeScreen();
  }

  void bindView(AuthScreenView authScreenView){
    this.authScreenView = authScreenView;
    authScreenView.registerListener(this);
    viewState = authScreenView.getViewState();

  }

  @override
  void onBottomNavBarOptionClicked(int position) 
  {
    updateViewState();
    viewState.updateBottomAppBarPosition(position);
  
  }

  @override
  Function getBottomNavBarClickListener() => onBottomNavBarOptionClicked;

  void updateViewState()
  {
    viewState = authScreenView.getViewState();
  }

  @override
  void onBuyerSignUpButtonPressed() {
    print("Will Move To Buyer Sign Up Screen");
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => BuyerSignUpScreen()
    ));
//    Navigator.pushNamed(context, RoutingKeys.buyerSignUpScreen);
  }

  @override
  void onSellerSignUpButtonPressed() {
    print("Will Move To Seller Sign Up");
    Navigator.pushNamed(context, RoutingKeys.sellerSignUpScreen);
  }
}