import 'package:clima_weather_app/model/location.dart';
import 'package:clima_weather_app/tasks/WeatherInfoFetchingTask.dart';
import 'package:clima_weather_app/constants/strings.dart';
import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:clima_weather_app/screens/searchCityScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../customWidgets/weatherInfoScreenWidets.dart';

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

class SecondScreenBody extends StatefulWidget {
  final WeatherData weatherData;
  final bool loadingVisibility = false;
  SecondScreenBody({this.weatherData});

  @override
  _SecondScreenBodyState createState() => _SecondScreenBodyState();
}

class _SecondScreenBodyState extends State<SecondScreenBody> {
  WeatherData weatherData;
  bool loadingVisibility = false,isCurrentLocation = true;
  Location currentLocation = Location();


  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherData;
  }

  void moveToSearchCityScreen(BuildContext context) async {
    var cityName = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchCityScreen()));
    print("Updated Location Data $cityName");
    if (cityName != null) {
      updateWeatherDataByCityName(cityName);
    }
  }

  void updateWeatherDataByCityName(String cityName) async {
    setState(() {
      loadingVisibility = true;
      isCurrentLocation = false;
    });
    WeatherInfoFetchingTask weatherInfoFetchingTask = WeatherInfoFetchingTask();
    WeatherData weatherData =
        await weatherInfoFetchingTask.fetchWeatherInfoByCityName(cityName);
    setState(() {
      if (weatherData != null) this.weatherData = weatherData;
      loadingVisibility = false;
    });
  }

  void updateWeatherDataByCurrentLocation() async
  {
    setState(() {loadingVisibility = true;});
    currentLocation = Location();
    await currentLocation.getLocation();
    WeatherInfoFetchingTask weatherInfoFetchingTask = WeatherInfoFetchingTask();
    WeatherData weatherData = await weatherInfoFetchingTask.fetchWeatherInfoByLocation(currentLocation);
    setState(() {
      if (weatherData != null) this.weatherData = weatherData;
      loadingVisibility = false;
      isCurrentLocation = true;
    });

  }

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
                      infoText: weatherData.temperature.toString() +
                          String.fromCharCode(0x00B0) +
                          "C",
                      fontSize: 56.0,
                      color: Colors.white,
                      padding: 0.0,
                    ),
                    WeatherInfoFetchingButton(
                      text: SEARCH_FOR_OTHER_CITY,
                      icon: FontAwesomeIcons.locationArrow,
                      onTapFunction: (){
                        moveToSearchCityScreen(context);
                      }
                    ),
                    Visibility(
                      maintainState: true,
                      maintainAnimation: true,
                      visible: !isCurrentLocation,
                      child: WeatherInfoFetchingButton(
                        text: GET_CURRENT_LOCATION,
                        icon: FontAwesomeIcons.mapMarked,
                        onTapFunction: (){
                          updateWeatherDataByCurrentLocation();
                        },
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
                            text: weatherData.temperature.toString() +
                                TEMPERATURE_UNIT,
                            icon: FontAwesomeIcons.temperatureHigh,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: HUMIDITY,
                            text:
                                weatherData.humidity.toString() + HUMIDITY_UNIT,
                            icon: FontAwesomeIcons.pooStorm,
                          ),
                          LineDivider(),
                          SubInfoText(
                            title: WIND_SPEED,
                            text: weatherData.windSpeed.toString() +
                                WIND_SPEED_UNIT,
                            icon: FontAwesomeIcons.wind,
                          ),
                          LineDivider(),
                          SubInfoText(
                              title: PRESSURE,
                              text: weatherData.pressure.toString() +
                                  PRESSURE_UNIT,
                              icon: FontAwesomeIcons.meteor),
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
        ),
        Visibility(
          visible: loadingVisibility,
          maintainAnimation: true,
          maintainState: true,
          child: WeatherInfoLoadingView(),
        )
      ],
    );
  }
}
