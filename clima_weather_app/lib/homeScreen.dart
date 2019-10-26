
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

  void gotoSecondScreen()
  {
    Navigator.pushNamed(context, "/second");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Clima"
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: ()
            {
              gotoSecondScreen();
            },
            child: Text(
                "Go to second screen"
            ),
          ),
        ),
      ),
    );
  }
}
