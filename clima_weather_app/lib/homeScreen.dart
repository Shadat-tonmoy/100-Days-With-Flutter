import 'dart:convert';

import 'package:clima_weather_app/model/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location location;
  String currentPositionMessage = "Getting Current Location....";

  void gotoSecondScreen() {
    Navigator.pushNamed(context, "/second");
  }

  void getLocation() async
  {
    location = Location();
    await location.getLocation();

    setState(()
    {
      currentPositionMessage = "Your Current Location\n Longitude ${location.longitude} And Latitude ${location.latitude}";
    });
  }

  void getWeather() async
  {
    String url = "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22";
    http.Response response = await http.get(url);
    if(response.statusCode == 200)
    {
      String apiResponse = response.body;
      dynamic responseJSON = jsonDecode(apiResponse);
      double longitude = responseJSON["coord"]["lon"];
      double latitude = responseJSON["coord"]["lat"];
      String weatherTitle = responseJSON["weather"][0]["main"];
      double temperature = responseJSON["main"]["temp"];
      double pressure = responseJSON["main"]["pressure"];
      int humidity = responseJSON["main"]["humidity"];
      print("Longitude : $longitude\nLatitude : $latitude\nTitle : $weatherTitle\nTemparature : $temperature\n"
          "Pressure : $pressure\nHumidity : $humidity");

    }
    else
    {
      print("Error in api ${response.statusCode}");

    }

  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context)
  {

    getWeather();

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
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
