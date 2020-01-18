import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/views/authScreenView.dart';
import 'package:flutter/cupertino.dart';

class AuthScreenController implements AuthScreenListener
{

  final BuildContext context;
  AuthScreenView authScreenView;
  AuthScreenViewState viewState;

  AuthScreenController({@required this.context});

  void _moveToHomeScreen()
  {
    Navigator.pushReplacementNamed(
        context, RoutingKeys.HOME_SCREEN);
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
}