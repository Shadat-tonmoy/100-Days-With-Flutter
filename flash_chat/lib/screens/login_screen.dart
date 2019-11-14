import 'package:flash_chat/constants/constant_values.dart';
import 'package:flash_chat/customWidgets/buttonWidgets.dart';
import 'package:flash_chat/styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: AnimationTags.ANIMATED_LOGO,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputFieldDecoration.copyWith(hintText: "Enter your email."),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                  obscureText: true,
                  decoration: kInputFieldDecoration.copyWith(hintText: "Enter your password."),
                ),
                SizedBox(
                  height: 24.0,
                ),
                AppMaterialButton(
                  color: Colors.lightBlueAccent,
                  text: "Log In",
                  onPressedCallback: (){
                    //implementation of login functionalities
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
