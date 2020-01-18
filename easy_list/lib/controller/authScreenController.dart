import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/views/authScreenView.dart';
import 'package:flutter/cupertino.dart';

class AuthScreenController implements AuthScreenListener
{

  final BuildContext context;

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
}