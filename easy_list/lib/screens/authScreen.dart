import 'package:easy_list/controller/authScreenController.dart';
import 'package:easy_list/customWidgets/authScreenWidget.dart';
import 'package:easy_list/views/authScreenView.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    AuthScreenController authScreenController = AuthScreenController(context: context);
    return Scaffold(
      bottomNavigationBar: AuthScreenBottomNavBar(),
      body: AuthScreenView(authScreenListener: authScreenController,),
    );
  }
}
