import 'package:clima_weather_app/constants/strings.dart';
import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charcode/ascii.dart';

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
              )
            ],
          ),
        )
      ],
    );
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[400],
      indent: 16.0,
      endIndent: 16.0,
    );
  }
}

class SubInfoText extends StatelessWidget {
  final String title,text;
  final IconData icon;


  SubInfoText({this.text, this.icon,this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 16.0,
          ),
          Icon(
            icon,
            size: 18.0,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            title
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          )
        ],
      ),
    );
  }
}

class MainInfoText extends StatelessWidget {
  final String infoText;
  final double padding, fontSize;
  final Color color;

  MainInfoText({this.infoText, this.fontSize, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          infoText,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
