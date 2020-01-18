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
         onPressed();
        },
        color: Theme.of(context).primaryColor,
      ),
    );
  }

}

class AuthScreenBottomNavBar extends StatefulWidget
{
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
        });

      },

    );
  }
}
