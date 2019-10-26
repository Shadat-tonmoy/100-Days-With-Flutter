import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position position;
  String currentPositionMessage = "Getting Current Location....";

  void gotoSecondScreen() {
    Navigator.pushNamed(context, "/second");
  }

  void getLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      setState(() {
        currentPositionMessage = "Location is $position";
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              gotoSecondScreen();
            },
            child: Center(
              child: Text("Go to second screen"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              currentPositionMessage,
            ),
          )
        ],
      ),
    );
  }
}
