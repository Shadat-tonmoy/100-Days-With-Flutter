import 'package:clima_weather_app/constants/strings.dart';
import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'customWidgets/weatherInfoScreenWidets.dart';

class SecondScreen extends StatefulWidget {
  final WeatherData weatherData;

  SecondScreen({this.weatherData});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  WeatherData weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherData;
    print("Mathod Called Init State Weather Data ${weatherData.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    print("Method Called Build");
    return Scaffold(
      body: new SecondScreenBody(
        weatherData: weatherData,
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Method Called Deactivate");
  }
}

class SecondScreenBody extends StatelessWidget {
  final WeatherData weatherData;

  SecondScreenBody({this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage("images/night.png"),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          color: Color.fromARGB(100, 0, 0, 0),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MainInfoText(
                      infoText: weatherData.location.cityName,
                      fontSize: 24.0,
                      color: Colors.white,
                      padding: 8.0,
                    ),
                    MainInfoText(
                      infoText: weatherData.temperature.toString() + String.fromCharCode(0x00B0) + "C",
                      fontSize: 56.0,
                      color: Colors.white,
                      padding: 0.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        print("Tapped On Location ICOn");
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              "Search For Other City",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  )),
                  elevation: 16.0,
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 16.0,
                          ),
                          SubInfoText(
                            title: LOCATION,
                            text: weatherData.location.cityName,
                            icon: FontAwesomeIcons.mapMarkerAlt,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: SKY,
                            text: weatherData.weatherTitle,
                            icon: FontAwesomeIcons.cloudSunRain,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: TEMPERATURE,
                            text: weatherData.temperature.toString() + TEMPERATURE_UNIT,
                            icon: FontAwesomeIcons.temperatureHigh,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: HUMIDITY,
                            text: weatherData.humidity.toString() + HUMIDITY_UNIT,
                            icon: FontAwesomeIcons.pooStorm,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: WIND_SPEED,
                            text: weatherData.windSpeed.toString() + WIND_SPEED_UNIT,
                            icon: FontAwesomeIcons.wind,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: PRESSURE,
                            text: weatherData.pressure.toString() + PRESSURE_UNIT,
                            icon: FontAwesomeIcons.meteor
                          ),
                          Text(
                            COPYRIGHT_MESSAGE,
                            style: TextStyle(
                              fontSize: 8.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


