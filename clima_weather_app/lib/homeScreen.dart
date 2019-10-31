import 'package:clima_weather_app/WeatherInfoFetchingTask.dart';
import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:clima_weather_app/model/location.dart';
import 'package:clima_weather_app/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location location;
  String currentPositionMessage = "Getting Current Location....",weatherInfo = "Fetching Weather Info...";

  void gotoSecondScreen(WeatherData weatherData)
  {
//    Navigator.pushNamed(context, "/second");
    Navigator.push(context, MaterialPageRoute(builder: (context)
    {
      return SecondScreen(weatherData: weatherData,);
    }));
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
    WeatherData weatherData = await weatherInfoFetchingTask.fetchWeatherInfo();
    setState(() {
//      weatherInfo = apiResponse;
      print("WeatherInfoFetched as ${weatherData.toString()}");
      gotoSecondScreen(weatherData);
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
      backgroundColor: Colors.black12,
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("images/day.png"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            color: Color.fromARGB(150, 0, 0, 0)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SpinKitWave(
                  size: 48.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                "Fetching Data. Please Wait...",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              /*Padding(
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
              )*/
            ],
          )
        ],
      ),
    );
  }
}
