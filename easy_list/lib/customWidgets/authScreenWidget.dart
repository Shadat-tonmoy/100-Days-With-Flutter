import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreenWidget
{
  final BuildContext context;

  AuthScreenWidget({@required this.context});

  Widget getInputField({@required String label, @required bool isObscureText, TextInputType textInputType}){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        obscureText: isObscureText,
        keyboardType: textInputType,
      ),
    );

  }

  Widget getLoginButton({@required Function onPressed})
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      child: FlatButton(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        onPressed: () {
         onPressed(context);
        },
        color: Theme.of(context).primaryColor,
      ),
    );

  }

}