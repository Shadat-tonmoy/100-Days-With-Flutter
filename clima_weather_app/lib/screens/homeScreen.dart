import 'dart:io';

import 'package:clima_weather_app/customWidgets/weatherInfoScreenWidets.dart';
import 'package:clima_weather_app/tasks/WeatherInfoFetchingTask.dart';
import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:clima_weather_app/model/location.dart';
import 'package:clima_weather_app/screens/weatherInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location location;
  String currentPositionMessage = "Getting Current Location....",
      weatherInfo = "Fetching Weather Info...";
  bool loadingVisibility = true;

  void gotoSecondScreen(WeatherData weatherData) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SecondScreen(
        weatherData: weatherData,
      );
    }));
  }

  void getLocation() async {
    location = Location();
    await location.getLocation();
    setState(() {
      currentPositionMessage =
          "Your Current Location\n Longitude ${location.longitude} And Latitude ${location.latitude}";
    });
    getWeather();
  }

  void getWeather() async {
    setState(() {
      loadingVisibility = true;
    });
    WeatherInfoFetchingTask weatherInfoFetchingTask = WeatherInfoFetchingTask();
    WeatherData weatherData =
        await weatherInfoFetchingTask.fetchWeatherInfoByLocation(location);
    setState(() {
//      weatherInfo = apiResponse;
      print("WeatherInfoFetched as ${weatherData.toString()}");
      gotoSecondScreen(weatherData);
    });
  }

  Future<void> checkLocationPermissionStatus() async {
    PermissionStatus permissionStatus = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    if (permissionStatus == PermissionStatus.granted) {
      getLocation();
    } else {
      setState(() {
        loadingVisibility = false;
      });
      print("Permission Status $permissionStatus");
    }
  }

  Future<void> requestLocationPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
    checkLocationPermissionStatus();
  }

  void closeApp()
  {
    exit(0);
  }

  @override
  void initState() {
    super.initState();
//    getLocation();
    checkLocationPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("images/day.png"),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Visibility(
              visible: !loadingVisibility,
              maintainState: true,
              maintainAnimation: true,
              child: Center(
                child: Container(
                  height: 250.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Permission Required\nThis app requires you location permission! ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          HomeScreenButton(
                            text: "Allow Permission",
                            backgroundColor: Colors.green[50],
                            textColor: Colors.green[800],
                            onPressedFunction: () {
                              requestLocationPermission();
                            },
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          HomeScreenButton(
                            text: "Close Application",
                            backgroundColor: Colors.red[50],
                            textColor: Colors.red[800],
                            onPressedFunction: () {
                              closeApp();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: loadingVisibility,
              maintainAnimation: true,
              maintainState: true,
              child: WeatherInfoLoadingView(),
            ),
          ],
        ));
  }
}

class HomeScreenButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String text;
  final Function onPressedFunction;

  HomeScreenButton(
      {this.text,
      this.backgroundColor,
      this.textColor,
      this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 48.0,right: 48.0),
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: onPressedFunction,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
