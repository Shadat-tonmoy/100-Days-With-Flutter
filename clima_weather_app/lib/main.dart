import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main()
{
  runApp(ClimaApp());
}

class ClimaApp extends StatefulWidget {
  @override
  _ClimaAppState createState() => _ClimaAppState();
}

class _ClimaAppState extends State<ClimaApp> {

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
                //get location here
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




