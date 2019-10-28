import 'dart:convert';

import 'package:clima_weather_app/WeatherInfoFetchingTask.dart';
import 'package:clima_weather_app/model/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location location;
  String currentPositionMessage = "Getting Current Location....",weatherInfo = "Fetching Weather Info...";


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

    getWeather();
  }

  void getWeather() async
  {
    WeatherInfoFetchingTask weatherInfoFetchingTask = WeatherInfoFetchingTask(location);
    String apiResponse = await weatherInfoFetchingTask.fetchWeatherInfo();
    setState(() {
      weatherInfo = apiResponse;
    });


  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context)
  {

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
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Weather Information\n$weatherInfo",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
