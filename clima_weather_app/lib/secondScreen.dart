import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:flutter/material.dart';

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
        SafeArea(
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
        )
      ],
    );
  }
}

class MainInfoText extends StatelessWidget
{
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
