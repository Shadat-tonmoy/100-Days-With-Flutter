import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  children: <Widget>[
                    MainInfoText(
                      infoText: weatherData.location.cityName,
                      fontSize: 24.0,
                      color: Colors.white,
                      padding: 16.0,
                    ),
                    MainInfoText(
                      infoText: weatherData.temperature.toString(),
                      fontSize: 64.0,
                      color: Colors.white,
                      padding: 0.0,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
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
                          text: weatherData.location.cityName,
                          icon: FontAwesomeIcons.mapMarkerAlt,
                        ),
                        LineDivider(),
                        SubInfoText(
                          text: weatherData.weatherTitle,
                          icon: FontAwesomeIcons.cloudSunRain,
                        ),
                        LineDivider(),
                        SubInfoText(
                          text: weatherData.humidity.toString(),
                          icon: FontAwesomeIcons.wind,

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
  final String text;
  final IconData icon;

  SubInfoText({this.text, this.icon});

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
            size: 24.0,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
            ),
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
