import 'package:easy_list/controller/authScreenController.dart';
import 'package:easy_list/customWidgets/authScreenWidget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget
{

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    AuthScreenWidget authScreenWidget = AuthScreenWidget(context: context);
    AuthScreenController authScreenController = AuthScreenController(context: context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Login As Buyer"),
            icon: Icon(Icons.person),
          ),

          BottomNavigationBarItem(
            title: Text("Login As Seller"),
            icon: Icon(Icons.person_pin_circle),
          ),
        ],
        onTap: (position){
          setState(() {
            currentPageIndex = position;
          });

        },

      ),
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
                  onPressed: authScreenController.getMoveToHomeScreenCallback()
              )
            ],
          ),
        ),
      ),
    );
  }
}
