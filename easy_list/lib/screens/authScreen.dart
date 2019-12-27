import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 24.0,
              ),
              FlatButton(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, RoutingKeys.HOME_SCREEN);
                },
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
