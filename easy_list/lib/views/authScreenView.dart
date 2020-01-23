import 'package:easy_list/controller/authScreenController.dart';
import 'package:easy_list/customWidgets/authScreenWidget.dart';
import 'package:flutter/material.dart';



class AuthScreenView extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView>
{

  int bottomNavPosition = 0;
  AuthScreenController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = AuthScreenController(context: context);
    AuthScreenWidget authScreenWidget = AuthScreenWidget(context: context);
    authScreenWidget.registerListener(controller);
    return Scaffold(
      bottomNavigationBar: AuthScreenBottomNavBar(onClickListener: updateBottomAppBarPosition),
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

  void onBuyerSignUpButtonPressed();

  void onSellerSignUpButtonPressed();
}
