import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/customWidgets/authScreenWidget.dart';
import 'package:easy_list/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget
{

  void moveToHomeScreen(BuildContext context)
  {
    Navigator.pushReplacementNamed(
        context, RoutingKeys.HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    AuthScreenWidget authScreenWidget = AuthScreenWidget(context: context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              authScreenWidget.getInputField(
                  label: "Email",
                  isObscureText: false,
                  textInputType: TextInputType.emailAddress
              ),
              authScreenWidget.getInputField(
                  label: "Password",
                  isObscureText: true
              ),
              authScreenWidget.getLoginButton(
                  onPressed: moveToHomeScreen
              )
            ],
          ),
        ),
      ),
    );
  }
}
