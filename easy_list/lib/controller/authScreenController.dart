import 'package:easy_list/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class AuthScreenController
{

  final BuildContext context;

  AuthScreenController({@required this.context});

  void _moveToHomeScreen()
  {
    Navigator.pushReplacementNamed(
        context, RoutingKeys.HOME_SCREEN);
  }

  Function getMoveToHomeScreenCallback()
  {
    return _moveToHomeScreen;
  }
}