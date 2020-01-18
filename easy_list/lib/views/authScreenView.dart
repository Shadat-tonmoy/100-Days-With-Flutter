import 'package:easy_list/customWidgets/authScreenWidget.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class AuthScreenView extends StatefulWidget
{
  AuthScreenListener authScreenListener;
  AuthScreenViewState authScreenViewState;

  AuthScreenView();

  @override
  AuthScreenViewState createState() {
    authScreenViewState = AuthScreenViewState();
    return authScreenViewState;
  }

  void registerListener(AuthScreenListener authScreenListener) => this.authScreenListener = authScreenListener;
  AuthScreenViewState getViewState() => this.authScreenViewState;

}

class AuthScreenViewState extends State<AuthScreenView>
{

  AuthScreenListener controller;
  int bottomNavPosition = 0;

  @override
  void initState() {
    super.initState();
    controller = widget.authScreenListener;
  }

  @override
  Widget build(BuildContext context) {
    AuthScreenWidget authScreenWidget = AuthScreenWidget(context: context);
    authScreenWidget.registerListener(controller);
    return Scaffold(
      bottomNavigationBar: AuthScreenBottomNavBar(onClickListener: controller.getBottomNavBarClickListener()),
      body: Center(
        child: authScreenWidget.getUserForm(bottomNavPosition),
      ),
    );
  }

  void updateBottomAppBarPosition(int position) {
    setState(() {bottomNavPosition = position;});
  }
}

abstract class AuthScreenListener{

  void onLoginButtonPressed();

  void onBottomNavBarOptionClicked(int position);

  Function getBottomNavBarClickListener();
}
