import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void getLocation() async
  {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Clima"
          ),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: (){
                getLocation();
              },
              child: Text(
                  "Get Location"
              ),
            ),
          ),
        ),
      ),
    );
  }
}




