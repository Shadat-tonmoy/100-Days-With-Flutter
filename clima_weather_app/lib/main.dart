import 'package:clima_weather_app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }

}




