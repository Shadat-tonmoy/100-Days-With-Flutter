import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(
            "Login"
          ),
          onPressed: ()
          {

            /*Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => HomeScreen()
            ));*/

            Navigator.pushReplacementNamed(context, RoutingKeys.HOME_SCREEN);

          },
        ),
      ),
    );
  }
}
