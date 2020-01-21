import 'package:easy_list/constants/constants.dart';
import 'package:easy_list/views/authScreenView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreenWidget
{
  final BuildContext context;
  AuthScreenListener authScreenListener;

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
         onPressed();
        },
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget getSignUpButton({String text, Function onTap})
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.deepOrange[900]
          ),
        ),
      ),
    );

  }

  Widget getUserForm(int position)
  {
    if(position == 0)
      return getBuyerLoginForm();
    else if(position == 1)
      return getSellerLoginForm();
    return null;
  }

  Widget getBuyerLoginForm()
  {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getInputField(
              label: "Email",
              isObscureText: false,
              textInputType: TextInputType.emailAddress
          ),
          getInputField(
              label: "Password",
              isObscureText: true
          ),
          getLoginButton(
              onPressed: () => authScreenListener.onLoginButtonPressed()
          ),
          getSignUpButton(
            text: Strings.signUpMessage,
            onTap: () => authScreenListener.onBuyerSignUpButtonPressed()
          )
        ],
      ),
    );
  }

  Widget getSellerLoginForm()
  {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getInputField(
              label: "Seller Email",
              isObscureText: false,
              textInputType: TextInputType.emailAddress
          ),
          getInputField(
              label: "Seller Password",
              isObscureText: true
          ),
          getLoginButton(
              onPressed: () => authScreenListener.onLoginButtonPressed()
          ),
          getSignUpButton(
              text: Strings.signUpMessage,
              onTap: () => authScreenListener.onSellerSignUpButtonPressed()
          )
        ],
      ),
    );
  }

  void registerListener(AuthScreenListener authScreenListener)
  {
    this.authScreenListener = authScreenListener;
  }

}

class AuthScreenBottomNavBar extends StatefulWidget
{
  final Function onClickListener;

  AuthScreenBottomNavBar({this.onClickListener});

  @override
  _AuthScreenBottomNavBarState createState() => _AuthScreenBottomNavBarState();
}

class _AuthScreenBottomNavBarState extends State<AuthScreenBottomNavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context)
  {
    return BottomNavigationBar(
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
          widget.onClickListener(position);
        });

      },

    );
  }
}
