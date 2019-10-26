
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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

  void getLocation() async
  {
    Position position= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print("Current Location $position");
    

  }

  @override
  void initState() {

    super.initState();
    getLocation();
  }


  @override
  Widget build(BuildContext context)
  {

    String marginInput = '32.0';
    double scaffoldMargin;

    try
    {
      scaffoldMargin = double.parse(marginInput);
    }
    catch(e)
    {
      scaffoldMargin = 20.0;

    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Clima"
        ),
      ),
      body: Container(
        color: Colors.grey,
        margin: EdgeInsets.all(scaffoldMargin ?? 50.0),
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
