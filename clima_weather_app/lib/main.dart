import 'package:clima_weather_app/homeScreen.dart';
import 'package:clima_weather_app/secondScreen.dart';
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
      theme: ThemeData.light(

      ).copyWith(
        primaryColor: Colors.purple
      ),
      initialRoute: "/",
      routes:
      {
        "/" : (context) => HomeScreen(),
        "/second" : (context) => SecondScreen()
      },
    );
  }

}




