import 'package:easy_list/customWidgets/authScreenWidget.dart';
import 'package:flutter/material.dart';

class AuthScreenView extends StatelessWidget
{
  final AuthScreenListener authScreenListener;

  AuthScreenView({this.authScreenListener});

  @override
  Widget build(BuildContext context) {
    AuthScreenWidget authScreenWidget = AuthScreenWidget(context: context);
    return Center(
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
                onPressed: () => authScreenListener.onLoginButtonPressed()
            )
          ],
        ),
      ),
    );
  }
}

abstract class AuthScreenListener{

  void onLoginButtonPressed();
}
